// To parse this JSON data, do
//
//     final chefProfileDetailsModel = chefProfileDetailsModelFromJson(jsonString);

import 'dart:convert';

ChefProfileDetailsModel chefProfileDetailsModelFromJson(String str) => ChefProfileDetailsModel.fromJson(json.decode(str));

String chefProfileDetailsModelToJson(ChefProfileDetailsModel data) => json.encode(data.toJson());

class ChefProfileDetailsModel {
    ChefProfileDetailsModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory ChefProfileDetailsModel.fromJson(Map<String, dynamic> json) => ChefProfileDetailsModel(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.userId,
        this.profileName,
        this.profileDescription,
        this.profileTags,
        this.profileSlug,
        this.prefferedCurrency,
        this.isDeleted,
        this.fssaiNo,
        this.status,
        this.notificationToken,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.user,
        this.address,
    });

    int? id;
    int? userId;
    String? profileName;
    String? profileDescription;
    String? profileTags;
    String? profileSlug;
    String? prefferedCurrency;
    bool? isDeleted;
    String? fssaiNo;
    String? status;
    dynamic notificationToken;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    int? updatedBy;
    User? user;
    List<Address>? address;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["userId"],
        profileName: json["profileName"],
        profileDescription: json["profileDescription"],
        profileTags: json["profileTags"],
        profileSlug: json["profileSlug"],
        prefferedCurrency: json["prefferedCurrency"],
        isDeleted: json["isDeleted"],
        fssaiNo: json["fssaiNo"],
        status: json["status"],
        notificationToken: json["notificationToken"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        user: User.fromJson(json["User"]),
        address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "profileName": profileName,
        "profileDescription": profileDescription,
        "profileTags": profileTags,
        "profileSlug": profileSlug,
        "prefferedCurrency": prefferedCurrency,
        "isDeleted": isDeleted,
        "fssaiNo": fssaiNo,
        "status": status,
        "notificationToken": notificationToken,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "User": user!.toJson(),
        "address": List<dynamic>.from(address!.map((x) => x.toJson())),
    };
}

class Address {
    Address({
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
    int? updatedBy;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        profileId: json["profileId"],
        userId: json["userId"],
        showAddress: json["showAddress"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        timeZone: json["timeZone"],
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
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
        "latitude": latitude,
        "longitude": longitude,
        "timeZone": timeZone,
        "isPrimary": isPrimary,
        "isHome": isHome,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}

class User {
    User({
        this.phoneNumber,
        this.email,
    });

    String? phoneNumber;
    String? email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phoneNumber"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "email": email,
    };
}
