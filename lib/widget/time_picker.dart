



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/controller/ForecastController.dart';


List<String> listHour = ["0:00", "03:00", "06:00", "09:00", "12:00", "15:00", "18:00", "21:00"];



class TimePickerRow extends StatefulWidget{
  TimePickerRow({ required this.controller, required this.callbackTabPressed});

  final List<String> tabItems = listHour;
  final ForecastController controller;
  final void Function(int) callbackTabPressed;
  final int startIndex = 0;

  @override
  State<StatefulWidget> createState() => TimePickerState();

}

class TimePickerState extends State<TimePickerRow> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late int activeTabIndex;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabItems.length, vsync: this,
    initialIndex: widget.startIndex,);
    _tabController.addListener(_tabChangeHandler);
    super.initState();
  }

  void _tabChangeHandler() {
    if(_tabController.indexIsChanging) return;
    widget.callbackTabPressed(_tabController.index);
    setState(() {
      activeTabIndex = _tabController.index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle:
      Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12.0),
      labelStyle:
      Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12.0),
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
      controller: _tabController,
      tabs: widget.tabItems.map((t) => Text(t)).toList(),
      isScrollable: true,
    );
  }
}