import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class TemperatureCircleCard extends StatelessWidget {
  final int temperature = 22;
  final String describe = "Mostly \n Clear";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          color: AppColor.colorBackground,
          height: 220,
          width: 260,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [

                    Transform.translate(
                      offset: Offset(20, -40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Add the missing bracket here
                          Text(
                            "22°",
                            style: TextStyle(
                              fontSize: 150,
                              shadows: [
                                Shadow(
                                  color: Color(0xFF0A36AD),
                                  offset: Offset(5, 10),
                                  blurRadius: 20,
                                ),
                              ],
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ], // Add the missing bracket here
                      ),
                    ),Transform.translate(
                      offset: Offset(80, 100),
                      child: Row(
                        children: [Text(
                          "Sunny",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white70,
                          ),
                        ),
                          Image.asset("images/sun.png"),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); // Remove the extra bracket and semicolon here
  }
}
