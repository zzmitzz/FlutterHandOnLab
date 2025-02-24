import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/models/city.dart';
import 'package:flutter1/page/forecast_page.dart';
import 'package:flutter1/style.dart';
import 'package:flutter1/widget/main_app_bar.dart';

void main() {
  runApp(const MyActivity());
}

class MyActivity extends StatelessWidget {
  const MyActivity({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter test",
      home: HomePage(city: City("Ha Noi")),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.city});

  final City city;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(widget.city.name),
      backgroundColor: AppColor.duskSky ,
      body: HomeMain(),
    );
  }
}
