// To parse this JSON data, do
//
//     final chefReviewsModel = chefReviewsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ChefReviewsModel chefReviewsModelFromJson(String str) => ChefReviewsModel.fromJson(json.decode(str));

String chefReviewsModelToJson(ChefReviewsModel data) => json.encode(data.toJson());

class ChefReviewsModel {
    ChefReviewsModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory ChefReviewsModel.fromJson(Map<String, dynamic> json) => ChefReviewsModel(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.commentId,
        this.consumerId,
        this.consumerName,
        this.chefId,
        this.orderId,
        this.comments,
        this.productId,
        this.commentType,
        this.commentsSlug,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? commentId;
    int? consumerId;
    String? consumerName;
    int? chefId;
    int? orderId;
    String? comments;
    int? productId;
    String? commentType;
    String? commentsSlug;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic? updatedBy;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        commentId: json["commentId"] == null ? null : json["commentId"],
        consumerId: json["consumerId"] == null ? null : json["consumerId"],
        consumerName: json["consumerName"] == null ? null : json["consumerName"],
        chefId: json["chefId"] == null ? null : json["chefId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        comments: json["comments"] == null ? null : json["comments"],
        productId: json["productId"] == null ? null : json["productId"],
        commentType: json["commentType"] == null ? null :json["commentType"],
        commentsSlug: json["commentsSlug"] == null ? null : json["commentsSlug"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "commentId": commentId == null ? null : commentId,
        "consumerId": consumerId == null ? null : consumerId,
        "consumerName": consumerName == null ? null : consumerName,
        "chefId": chefId == null ? null : chefId,
        "orderId": orderId == null ? null : orderId,
        "comments": comments == null ? null : comments,
        "productId": productId == null ? null : productId,
        "commentType": commentType == null ? null :commentType,
        "commentsSlug": commentsSlug == null ? null : commentsSlug,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
    };
}



class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
