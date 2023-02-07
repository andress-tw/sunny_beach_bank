// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

import 'package:sunny_beach_bank/domain/models/user/user.dart';

class Account {
    Account({
        required this.id,
        required this.balance,
        required this.type,
        required this.user,
    });

    String id;
    double balance;
    String type;
    User user;

    factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        balance: json["balance"]?.toDouble(),
        type: json["type"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "type": type,
        "user": user.toJson(),
    };
}
