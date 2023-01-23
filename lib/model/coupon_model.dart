// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
    CouponModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.couponId,
        this.couponCode,
        this.couponDescription,
        this.couponType,
        this.applicableService,
        this.minimumValue,
        this.maximumValue,
        this.detectionType,
        this.couponValue,
        this.noOfUsages,
        this.startDate,
        this.expiryDate,
        this.applicableConsumer,
        this.applicableChef,
        this.couponStatus,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? couponId;
    String? couponCode;
    String? couponDescription;
    String? couponType;
    String? applicableService;
    int? minimumValue;
    int? maximumValue;
    String? detectionType;
    int? couponValue;
    int? noOfUsages;
    DateTime? startDate;
    DateTime? expiryDate;
    String? applicableConsumer;
    String? applicableChef;
    String? couponStatus;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic createdBy;
    dynamic updatedBy;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        couponId: json["couponId"],
        couponCode: json["couponCode"],
        couponDescription: json["couponDescription"],
        couponType: json["couponType"],
        applicableService: json["applicableService"],
        minimumValue: json["minimumValue"],
        maximumValue: json["maximumValue"],
        detectionType: json["detectionType"],
        couponValue: json["couponValue"],
        noOfUsages: json["noOfUsages"],
        startDate: DateTime.parse(json["startDate"]),
        expiryDate: DateTime.parse(json["expiryDate"]),
        applicableConsumer: json["applicableConsumer"],
        applicableChef: json["applicableChef"],
        couponStatus: json["couponStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "couponId": couponId,
        "couponCode": couponCode,
        "couponDescription": couponDescription,
        "couponType": couponType,
        "applicableService": applicableService,
        "minimumValue": minimumValue,
        "maximumValue": maximumValue,
        "detectionType": detectionType,
        "couponValue": couponValue,
        "noOfUsages": noOfUsages,
        "startDate": startDate!.toIso8601String(),
        "expiryDate": expiryDate!.toIso8601String(),
        "applicableConsumer": applicableConsumer,
        "applicableChef": applicableChef,
        "couponStatus": couponStatus,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}
