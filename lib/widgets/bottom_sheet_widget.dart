import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models/class_model.dart';
import 'package:flutter_app_demo/models/section_model.dart';
import 'package:flutter_app_demo/models/selected_class_section.dart';

import '../main.dart';

class BottomSheetWidget extends StatefulWidget {
  final ValueChanged<SelectedClassSection> valueChangedCallBack;

  BottomSheetWidget(this.valueChangedCallBack);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var classList = List<ClassModel>();
  var sectionList = List<SectionModel>();
  int value = 0;
  SelectedClassSection selectedClassSection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedClassSection = SelectedClassSection(
        sectionName: "Section A", className: "Play School");
    //set week days
    classList.add(ClassModel(className: "Play School", isSelected: false));
    classList.add(ClassModel(
      className: "KG",
      isSelected: true,
    ));
    classList.add(ClassModel(
      className: "Class 1",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 2",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 3",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 4",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 5",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 6",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 7",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 8",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 9",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 10",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 11",
      isSelected: false,
    ));
    classList.add(ClassModel(
      className: "Class 12",
      isSelected: false,
    ));

    //set sections
    sectionList.add(SectionModel(
      sectionName: "Section A",
      isSelected: true,
    ));
    sectionList.add(SectionModel(
      sectionName: "Section B",
      isSelected: false,
    ));
    sectionList.add(SectionModel(
      sectionName: "Section C",
      isSelected: false,
    ));
    sectionList.add(SectionModel(
      sectionName: "Section D",
      isSelected: false,
    ));
    sectionList.add(SectionModel(
      sectionName: "Section E",
      isSelected: false,
    ));
    sectionList.add(SectionModel(
      sectionName: "Section F",
      isSelected: false,
    ));
    sectionList.add(SectionModel(
      sectionName: "Section G",
      isSelected: false,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 452,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Select Class & Section",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 400,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: new ListView.builder(
                        physics: const BouncingScrollPhysics(), // new
                        itemCount: classList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return InkWell(
                              onTap: () {
                                for (var model in classList) {
                                  model.isSelected = false;
                                }
                                classList[index].isSelected = true;
                                for (var seciton in sectionList) {
                                  seciton.isSelected = false;
                                }
                                sectionList[0].isSelected = true;
                                value = 0;

                                selectedClassSection.className =
                                    classList[index].className;
                                selectedClassSection.sectionName =
                                    sectionList[0].sectionName;
                                widget
                                    .valueChangedCallBack(selectedClassSection);
                                setState(() {});
                              },
                              child: ClassName(classModel: classList[index]));
                        }),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      child: new ListView.builder(
                          physics: const BouncingScrollPhysics(), // new
                          itemCount: sectionList.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: RadioListTile(
                                value: index,
                                groupValue: value,
                                onChanged: (ind) {
                                  for (var seciton in sectionList) {
                                    seciton.isSelected = false;
                                  }
                                  sectionList[ind].isSelected = true;

                                  selectedClassSection.sectionName =
                                      sectionList[ind].sectionName;
                                  widget.valueChangedCallBack(
                                      selectedClassSection);
                                  setState(() => value = ind);
                                },
                                title: Text(
                                  sectionList[index].sectionName,
                                  style: TextStyle(
                                      color: (sectionList[index].isSelected
                                          ? Colors.orange
                                          : Colors.black),fontSize: 15),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassName extends StatelessWidget {
  ClassModel classModel;

  ClassName({@required this.classModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (classModel.isSelected)
            ? Colors.grey.withOpacity(0.2)
            : Colors.white,
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.2)),
          right: BorderSide(width: 2.0, color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          classModel.className,
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),
        ),
      ),
    );
  }
}

class SectionName extends StatelessWidget {
  SectionModel sectionModel;

  SectionName({@required this.sectionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (sectionModel.isSelected)
            ? Colors.grey.withOpacity(0.4)
            : Colors.white,
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.4)),
          right: BorderSide(width: 2.0, color: Colors.grey.withOpacity(0.4)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          sectionModel.sectionName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
