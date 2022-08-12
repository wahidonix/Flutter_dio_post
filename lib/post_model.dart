// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.title,
    required this.opis,
    required this.id,
    required this.date,
    required this.v,
  });

  String? title;
  String? opis;
  String? id;
  DateTime date;
  int? v;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"],
        opis: json["opis"],
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "opis": opis,
        "_id": id,
        "date": date.toIso8601String(),
        "__v": v,
      };
}
