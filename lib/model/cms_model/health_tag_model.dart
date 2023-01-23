// To parse this JSON data, do
//
//     final healthTagModel = healthTagModelFromJson(jsonString);

import 'dart:convert';

List<HealthTagModel> healthTagModelFromJson(String str) => List<HealthTagModel>.from(json.decode(str).map((x) => HealthTagModel.fromJson(x)));

String healthTagModelToJson(List<HealthTagModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HealthTagModel {
    HealthTagModel({
        this.id,
        this.tags,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? tags;
    DateTime? publishedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory HealthTagModel.fromJson(Map<String, dynamic> json) => HealthTagModel(
        id: json["id"],
        tags: json["tags"],
        publishedAt: json["published_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tags": tags,
        "published_at": publishedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
