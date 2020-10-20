class FetchPeriodRequest {
  String classId;
  String sectionId;

  FetchPeriodRequest({this.classId, this.sectionId});

  FetchPeriodRequest.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    sectionId = json['sectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classId'] = this.classId;
    data['sectionId'] = this.sectionId;
    return data;
  }
}