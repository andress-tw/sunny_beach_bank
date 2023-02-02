// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

class Account {
    Account({
        required this.id,
        required this.balance,
        required this.type,
        required this.userid,
    });

    String id;
    double balance;
    String type;
    String userid;

    factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        balance: json["balance"]?.toDouble(),
        type: json["type"],
        userid: json["userid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "type": type,
        "userid": userid,
    };
}
