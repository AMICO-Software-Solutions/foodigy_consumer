// To parse this JSON data, do
//
//     final chefRatingModel = chefRatingModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ChefRatingModel chefRatingModelFromJson(String str) => ChefRatingModel.fromJson(json.decode(str));

String chefRatingModelToJson(ChefRatingModel data) => json.encode(data.toJson());

class ChefRatingModel {
    ChefRatingModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory ChefRatingModel.fromJson(Map<String, dynamic> json) => ChefRatingModel(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.pivotId,
        this.ratingId,
        this.chefId,
        this.productId,
        this.ratingType,
        this.chefAverageRating,
        this.productAverageRating,
        this.chefRatingCount,
        this.productRatingCount,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    dynamic pivotId;
    int? ratingId;
    int? chefId;
    dynamic productId;
    String? ratingType;
    dynamic chefAverageRating;
    dynamic productAverageRating;
    dynamic chefRatingCount;
    dynamic productRatingCount;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic createdBy;
    dynamic updatedBy;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        pivotId: json["pivotId"] == null ? null : json["pivotId"],
        ratingId: json["ratingId"] == null ? null : json["ratingId"],
        chefId: json["chefId"] == null ? null : json["chefId"],
        productId: json["productId"],
        ratingType: json["ratingType"] == null ? null : json["ratingType"],
        chefAverageRating: json["chefAverageRating"] == null ? null : json["chefAverageRating"],
        productAverageRating: json["productAverageRating"],
        chefRatingCount: json["chefRatingCount"] == null ? null : json["chefRatingCount"],
        productRatingCount: json["productRatingCount"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "pivotId": pivotId == null ? null : pivotId,
        "ratingId": ratingId == null ? null : ratingId,
        "chefId": chefId == null ? null : chefId,
        "productId": productId,
        "ratingType": ratingType == null ? null : ratingType,
        "chefAverageRating": chefAverageRating == null ? null : chefAverageRating,
        "productAverageRating": productAverageRating,
        "chefRatingCount": chefRatingCount == null ? null : chefRatingCount,
        "productRatingCount": productRatingCount,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
    };
}
