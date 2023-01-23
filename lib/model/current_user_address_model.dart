// To parse this JSON data, do
//
//     final currentUserAddressModel = currentUserAddressModelFromJson(jsonString);

import 'dart:convert';

CurrentUserAddressModel currentUserAddressModelFromJson(String str) => CurrentUserAddressModel.fromJson(json.decode(str));

String currentUserAddressModelToJson(CurrentUserAddressModel data) => json.encode(data.toJson());

class CurrentUserAddressModel {
    CurrentUserAddressModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory CurrentUserAddressModel.fromJson(Map<String, dynamic> json) => CurrentUserAddressModel(
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
        this.id,
        this.profileId,
        this.userId,
        this.showAddress,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.country,
        this.pincode,
        this.latitude,
        this.longitude,
        this.timeZone,
        this.isPrimary,
        this.isHome,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? id;
    int? profileId;
    int? userId;
    bool? showAddress;
    String? addressLine1;
    String? addressLine2;
    String? city;
    String? state;
    String? country;
    int? pincode;
    double? latitude;
    double? longitude;
    String? timeZone;
    bool? isPrimary;
    bool? isHome;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        profileId: json["profileId"],
        userId: json["userId"],
        showAddress: json["showAddress"],
        addressLine1: json["addressLine1"] == null ? null : json["addressLine1"],
        addressLine2: json["addressLine2"] == null ? null : json["addressLine2"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        timeZone: json["timeZone"] == null ? null : json["timeZone"],
        isPrimary: json["isPrimary"],
        isHome: json["isHome"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profileId": profileId,
        "userId": userId,
        "showAddress": showAddress,
        "addressLine1": addressLine1 == null ? null : addressLine1,
        "addressLine2": addressLine2 == null ? null : addressLine2,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "pincode": pincode == null ? null : pincode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "timeZone": timeZone == null ? null : timeZone,
        "isPrimary": isPrimary,
        "isHome": isHome,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}
