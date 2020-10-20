import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models/week_day.dart';

class CustomTabWidget extends StatefulWidget {
  @override
  _CustomTabWidgetState createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> {
  var weekList = List<WeekDay>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //set week days
    weekList
        .add(WeekDay(weekName: "Mon", isSelected: false, color: Colors.black));
    weekList
        .add(WeekDay(weekName: "Tue", isSelected: true, color: Colors.black));
    weekList
        .add(WeekDay(weekName: "Wed", isSelected: false, color: Colors.black));
    weekList
        .add(WeekDay(weekName: "Thu", isSelected: false, color: Colors.black));
    weekList
        .add(WeekDay(weekName: "Fri", isSelected: false, color: Colors.black));
    weekList
        .add(WeekDay(weekName: "Sat", isSelected: false, color: Colors.orange));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6 - 8;
    // TODO: implement build
    return Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1.5,
            )),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12.0, top: 8, bottom: 8),
          child: new ListView.builder(
              itemCount: weekList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctxt, int index) {
                return listItem(weekList[index], width);
              }),
        ));
  }

  Widget listItem(WeekDay weekDay, double width) {
    return InkWell(
      onTap: (){
        for(var week in weekList)
          {
            week.isSelected=false;
          }
        weekDay.isSelected=true;
        setState(() {

        });
      },
      child: Center(
          child: Container(
              decoration: BoxDecoration(
                color: (weekDay.isSelected) ? Colors.orange : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              width: width,
              child: Center(
                  child: Text(
                weekDay.weekName,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: (weekDay.isSelected) ? Colors.white : weekDay.color),
              )))),
    );
  }
}
