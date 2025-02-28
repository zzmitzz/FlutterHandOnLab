import 'package:flutter/material.dart';
import 'package:flutter1/page/base/page_base.dart';
import 'package:flutter1/page/base/page_container.dart';
import 'package:flutter1/page/detail_page.dart';
import 'package:flutter1/page/home_page.dart';
import 'package:flutter1/page/welcome_screen.dart';
import 'package:flutter1/utils/page_routes.dart';

void main() {
  runApp(const MyActivity());
}

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class MyActivity extends StatefulWidget {
  const MyActivity({super.key});

  @override
  State<StatefulWidget> createState() => MyActivityState();
}

class MyActivityState extends State<MyActivity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: WelcomeScreen(),
        ),
      ),
      routes: {
        AppRoute.homePage:
            (context) => SafeArea(
              child: HomePage(),
            ),
        AppRoute.detailScreen: (context) => DetailScreen(),
      },
      navigatorObservers: [routeObserver],
    );
  }
}
