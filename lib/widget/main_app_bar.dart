import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String? name;

  MainAppBar(this.name);

  @override
  State<MainAppBar> createState() => _AppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.location_city),
          Text(
            widget.name  ?? "Ha Noi",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.ac_unit),
        ],
      ),
    );
  }
}
