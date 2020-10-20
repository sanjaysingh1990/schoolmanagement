import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models/selected_class_section.dart';
import 'package:flutter_app_demo/providers/class_section_provider.dart';
import 'package:flutter_app_demo/requestresponsemodels/fetch_period_reqeust.dart';
import 'package:flutter_app_demo/widgets/bottom_sheet_widget.dart';
import 'package:flutter_app_demo/widgets/custom_tab_widget.dart';
import 'package:flutter_app_demo/widgets/logo_widgets.dart';
import 'package:flutter_app_demo/widgets/period_break_left_view.dart';
import 'package:flutter_app_demo/widgets/period_left_view.dart';
import 'package:provider/provider.dart';

class SelectClassSection extends StatefulWidget {
  @override
  _SelectClassSectionState createState() => _SelectClassSectionState();
}

class _SelectClassSectionState extends State<SelectClassSection> {
  SelectedClassSection selectedClassSection;

  ClassSectionProvider provider;
  int periodCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedClassSection = SelectedClassSection(
        className: "Choose Your Class & ", sectionName: "Section");
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ClassSectionProvider>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text("Class Time Table"),
              Row(
                children: [
                  Text(
                    "2019-2020",
                    style: TextStyle(fontSize: 10),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    size: 20.0,
                  )
                ],
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  selectClass();
                },
                child: TopClassSelectionWidget(
                  selectedClassSection: selectedClassSection,
                )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTabWidget(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Stack(
                children: [
                  new ListView.builder(
                      physics: const BouncingScrollPhysics(), // new
                      itemCount: provider.periodDataList.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        var data = provider.periodDataList[index];
                        if (data.period != null) {
                          periodCount++; //update the period counter here
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 14.0, right: 8.0),
                            child: new PeriodLeftWidget(
                              timetable: data,
                              index: periodCount,
                            ),
                          );
                        } else
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 14.0, right: 8.0),
                            child: new PeriodBreakLeftWidget(
                              timetable: data,
                            ),
                          );
                      }),
                  Visibility(
                      visible: provider.periodDataList.length == 0,
                      child: Center(child: LogoWidget())),
                  Visibility(
                    visible: provider.getLoading(),
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          ],
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void selectClass() {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return BottomSheetWidget(callBack);
        });
  }

  void _hitApi() {
    periodCount = 0;
    provider.setLoading();
    provider.getPeriodData(FetchPeriodRequest(), context);
  }

  //get callback when class or preiod is selected
  ValueChanged<SelectedClassSection> callBack(
      SelectedClassSection selectedClassSection) {
    this.selectedClassSection = selectedClassSection;
    this.selectedClassSection.sectionName =
        " - ${this.selectedClassSection.sectionName}";

    _hitApi();
  }
}

class TopClassSelectionWidget extends StatelessWidget {
  final SelectedClassSection selectedClassSection;

  TopClassSelectionWidget({@required this.selectedClassSection});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.2)),
            bottom: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "${selectedClassSection.className}${selectedClassSection.sectionName}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
