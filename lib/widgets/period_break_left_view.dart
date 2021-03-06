import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/requestresponsemodels/fetch_period_response.dart';
import 'package:flutter_app_demo/widgets/widget_period.dart';
import 'package:flutter_app_demo/widgets/widget_period_break.dart';

class PeriodBreakLeftWidget extends StatelessWidget {
  final Timetable timetable;

  PeriodBreakLeftWidget({@required this.timetable});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      height: 90,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Column(
            children: [
              getHeading("8:00 am", 15),
              expandedSpace,

            ],
          ),
          SizedBox(
            width: 15,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [circlePoint, Expanded(child: DottedLine(
              direction: Axis.vertical,
              lineLength: double.infinity,
              lineThickness: 1.5,
              dashLength: 2.0,
              dashColor: Colors.orange,
              dashRadius: 0.0,
              dashGapLength: 2.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),)],
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8,top: 10),
            child: WidgetPeriodBreak(timetable: timetable,),
          ))
        ],
      ),
    );
  }

  get expandedSpace=> Expanded(child: Container(),);
  Widget getHeading(String heading, double fontSize) {
    return new Text(
      heading,
      style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600),
    );
  }

  get space => SizedBox(
        height: 20,
      );

  get circlePoint => Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.orange,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 10,
          height: 10,
          decoration: new BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
      ) //Your child widget
      );
}
