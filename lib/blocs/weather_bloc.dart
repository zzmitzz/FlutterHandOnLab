


import 'dart:async';

import '../service/weather_service.dart';

abstract class HomeState {}
abstract class HomeEvent {}

class LoadCityWeatherEvent extends HomeEvent {
  String? city;
  LoadCityWeatherEvent(this.city);
}

class HomeInitialState extends HomeState {

}
class HomeLoadingState extends HomeState {
  bool isLoading = false;
  HomeLoadingState(this.isLoading);
}
class HomeLoadedState extends HomeState {

}