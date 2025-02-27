



import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter1/page/base/page_base.dart';
import 'package:flutter1/page/detail_page.dart';
import 'package:flutter1/page/home_page.dart';

class PageContainer extends PageContainerBase{

  final PageType pageType;

  const PageContainer({super.key, required this.pageType});

  @override
  Widget get background => Container();


  @override
  Widget get body {
    switch(pageType) {
      case PageType.homePage: return HomePage();
      case PageType.detailPage: return DetailScreen();
    }
  }

  @override
  Color get colorBg => Color(0xFFFFFFFF);

  @override
  Widget get menuDrawer => Container();

  @override
  String get pageTile {
    switch(pageType) {
      case PageType.homePage: return "Home Page";
      case PageType.detailPage: return "Detail Page";
    }
  }

}