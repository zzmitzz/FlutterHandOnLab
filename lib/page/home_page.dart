import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/widget/home_ui_utils/top_components.dart';

import '../utils/page_routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children: [
            Container(
              color: Color(0xFFDBEDFB),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopHomeScreen("Ha Noi", "Monday, 1 January 10:00")
              ],
            )
          ],
        )
    );
  }
}
