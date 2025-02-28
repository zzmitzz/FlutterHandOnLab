import 'dart:async';
import 'package:flutter1/networks/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../service/weather_service.dart';

// Event
abstract class HomeEvent {}

class LoadInitialDataEvent extends HomeEvent {
  LoadInitialDataEvent();
}

class LoadCityWeatherEvent extends HomeEvent {
  String? city;
  LoadCityWeatherEvent(this.city);
}

// State
class HomeState {
  final CurrentLocationWeatherState currentLocationWeatherState;
  final ForecastDailyWeather forecastDailyWeather;
  HomeState({required this.currentLocationWeatherState, required this.forecastDailyWeather});
  factory HomeState.initialize() => HomeState(
    currentLocationWeatherState: CurrentLocationWeatherState(isLoading: true, currentDataLocation: null),
    forecastDailyWeather: ForecastDailyWeather(null, true),
  );

  HomeState copyWith({CurrentLocationWeatherState? currentLocationWeatherState, ForecastDailyWeather? forecastDailyWeather}){
    return HomeState(
      currentLocationWeatherState: currentLocationWeatherState ?? this.currentLocationWeatherState,
      forecastDailyWeather: forecastDailyWeather ?? this.forecastDailyWeather,
    );

  }
}
class CurrentLocationWeatherState {
  bool isLoading = false;
  final Map<String, dynamic>? currentDataLocation;

  CurrentLocationWeatherState({required this.isLoading, required this.currentDataLocation});
}

class ForecastDailyWeather {
  bool isLoading = false;
  final Map<String, dynamic>? data;
  ForecastDailyWeather(this.data, this.isLoading);

}
class WeatherBloc extends Bloc<HomeEvent, HomeState> {

  final ApiClient client = ApiClient();

  WeatherBloc() : super(HomeState.initialize()) {
    on<LoadInitialDataEvent>(_onLoadInitialDataEvent);
  }
  Future<void> _onLoadInitialDataEvent(
    LoadInitialDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeState.initialize().copyWith(
      currentLocationWeatherState: CurrentLocationWeatherState(isLoading: true, currentDataLocation: null)
    ));
    Map<String, dynamic> response = await client.doGet(endpoint: "current.json", queryParams: {"q":"Ha Noi"});
    emit(state.copyWith(
      currentLocationWeatherState: CurrentLocationWeatherState(isLoading: false, currentDataLocation: response),
    ));
    print(response.toString());
  }
}
