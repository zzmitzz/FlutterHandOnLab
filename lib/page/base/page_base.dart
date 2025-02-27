import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PageType { homePage, detailPage }


abstract class PageContainerBase extends StatelessWidget {
  const PageContainerBase({super.key});

  Widget get body;

  String get pageTile;

  Widget get menuDrawer;

  Widget get background;

  Color get colorBg;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,

        ),
        background,
        Scaffold(
          backgroundColor: colorBg,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0.0,
          //   title: Text(pageTile),
          //   systemOverlayStyle: SystemUiOverlayStyle.dark,
          // ),
          drawer: menuDrawer,
          body: body,
        )
      ],
    );
  }

}