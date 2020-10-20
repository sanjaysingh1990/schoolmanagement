import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/requestresponsemodels/fetch_period_reqeust.dart';
import 'package:flutter_app_demo/requestresponsemodels/fetch_period_response.dart';

class ClassSectionProvider with ChangeNotifier {
  var _isLoading = false;
  var periodDataList = List<Timetable>();

  getLoading() => _isLoading;

  Future<dynamic> getPeriodData(
      FetchPeriodRequest request, BuildContext context) async {

    Completer<dynamic> completer = new Completer<dynamic>();
    final response = await loadJson();

    hideLoader();
    FetchPeriodResponse fetchPeriodResponse =
        new FetchPeriodResponse.fromJson(response);
    periodDataList.clear(); //clear previous data
    periodDataList.addAll(fetchPeriodResponse.timetable); //add items
    completer.complete(fetchPeriodResponse);
    notifyListeners();
    return completer.future;
  }

  //load the data from local assets
  dynamic loadJson() async {
    String data = await rootBundle.loadString('assets/data.json');
    var jsonResult = json.decode(data);
    print(jsonResult);
    return jsonResult;
  }

  void hideLoader() {
    _isLoading = false;
    notifyListeners();
  }

  void setLoading() {
    _isLoading = true;
    notifyListeners();
  }
}
