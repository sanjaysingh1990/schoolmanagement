class FetchPeriodResponse {
  int periods;
  List<Timetable> timetable;

  FetchPeriodResponse({this.periods, this.timetable});

  FetchPeriodResponse.fromJson(Map<String, dynamic> json) {
    periods = json['periods'];
    if (json['timetable'] != null) {
      timetable = new List<Timetable>();
      json['timetable'].forEach((v) {
        timetable.add(new Timetable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['periods'] = this.periods;
    if (this.timetable != null) {
      data['timetable'] = this.timetable.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timetable {
  int period;
  int starttime;
  String subject;
  String staff;
  String breakTime;
  int endtime;

  Timetable(
      {this.period,
      this.starttime,
      this.subject,
      this.staff,
      this.breakTime,
      this.endtime});

  Timetable.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    starttime = json['starttime'];
    subject = json['subject'];
    staff = json['staff'];
    breakTime = json['break'];
    endtime = json['endtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['period'] = this.period;
    data['starttime'] = this.starttime;
    data['subject'] = this.subject;
    data['staff'] = this.staff;
    data['break'] = this.breakTime;
    data['endtime'] = this.endtime;
    return data;
  }
}
