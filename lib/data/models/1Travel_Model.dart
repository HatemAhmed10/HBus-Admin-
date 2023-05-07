import 'package:cloud_firestore/cloud_firestore.dart';

class TravelModel {
  String? id;
  String? country;
  String? Time;
  String? salary;
  Timestamp? date;
  String? date2;

  TravelModel({
    this.id,
    this.country,
    this.Time,
    this.salary,
    this.date,
    this.date2,
  });
  TravelModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    country = json["country"];
    Time = json["Time"];
    salary = json["salary"];
    date = json["date"];
    date2 = json["date2"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': country,
      'Time': Time,
      'salary': salary,
      'date': date,
      'date2': date2,
    };
  }
}
