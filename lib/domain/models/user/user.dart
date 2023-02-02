// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  User(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.birthDate,
      this.profilePath});

  String id;
  String name;
  String lastName;
  DateTime birthDate;
  String? profilePath;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json["name"],
      lastName: json["lastName"],
      birthDate: DateTime.parse(json["birthDate"]),
      profilePath: json["profilePath"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "birthDate":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "profilePath": profilePath
      };
}
