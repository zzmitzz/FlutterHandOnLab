import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/style.dart';

import '../utils/page_routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColor.colorHighLight,
                AppColor.colorBackground,
              ], // Replace with your desired colors
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("images/perspective_matte-192-128x128.png"),
              Column(
                children: [
                  Text(
                    "Weather",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: AppColor.colorOnBackground.withAlpha(200),
                    ),
                  ),
                  Text(
                    "Forecasts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      letterSpacing: -5,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      color: AppColor.colorSecondOnBackground,
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      color: Colors.white70
                  )),
                  Padding(padding: EdgeInsets.all(20)),
                  ElevatedButton(onPressed: () => {
                    Navigator.pushNamed(context, AppRoute.homePage)
                  } ,style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, // Background color
                    foregroundColor: AppColor.colorHighLight, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                    textStyle: const TextStyle(fontSize: 20), // Text style
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ), child: Text("Get Start",style: TextStyle(fontWeight: FontWeight.bold),),)
                ],
              ),

            ],
          ),
        )
      ],
    );
  }
}
