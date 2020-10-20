import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/requestresponsemodels/fetch_period_response.dart';

class WidgetPeriodBreak extends StatelessWidget
{
  final Timetable timetable;
  WidgetPeriodBreak({@required this.timetable});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50,
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(0.3),
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        child:Row(children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(timetable.breakTime,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

            ],),
          ),),


        ],) //Your child widget
    );
  }

}