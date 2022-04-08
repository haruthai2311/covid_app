// To parse this JSON data, do
//
//     final covidToDayProvinces = covidToDayProvincesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CovidToDayProvinces> covidToDayProvincesFromJson(String str) => List<CovidToDayProvinces>.from(json.decode(str).map((x) => CovidToDayProvinces.fromJson(x)));

String covidToDayProvincesToJson(List<CovidToDayProvinces> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidToDayProvinces {
    CovidToDayProvinces({
        required this.txnDate,
        required this.province,
        required this.newCase,
        required this.totalCase,
        required this.newCaseExcludeabroad,
        required this.totalCaseExcludeabroad,
        required this.newDeath,
        required this.totalDeath,
        required this.updateDate,
    });

    DateTime txnDate;
    String province;
    int newCase;
    int totalCase;
    int newCaseExcludeabroad;
    int totalCaseExcludeabroad;
    int newDeath;
    int totalDeath;
    DateTime updateDate;

    factory CovidToDayProvinces.fromJson(Map<String, dynamic> json) => CovidToDayProvinces(
        txnDate: DateTime.parse(json["txn_date"]),
        province: json["province"],
        newCase: json["new_case"],
        totalCase: json["total_case"],
        newCaseExcludeabroad: json["new_case_excludeabroad"],
        totalCaseExcludeabroad: json["total_case_excludeabroad"],
        newDeath: json["new_death"],
        totalDeath: json["total_death"],
        updateDate: DateTime.parse(json["update_date"]),
    );

    Map<String, dynamic> toJson() => {
        "txn_date": "${txnDate.year.toString().padLeft(4, '0')}-${txnDate.month.toString().padLeft(2, '0')}-${txnDate.day.toString().padLeft(2, '0')}",
        "province": province,
        "new_case": newCase,
        "total_case": totalCase,
        "new_case_excludeabroad": newCaseExcludeabroad,
        "total_case_excludeabroad": totalCaseExcludeabroad,
        "new_death": newDeath,
        "total_death": totalDeath,
        "update_date": updateDate.toIso8601String(),
    };
}
