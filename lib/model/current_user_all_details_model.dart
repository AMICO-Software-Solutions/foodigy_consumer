// To parse this JSON data, do
//
//     final currentUserAllDetailsModel = currentUserAllDetailsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

CurrentUserAllDetailsModel currentUserAllDetailsModelFromJson(String str) => CurrentUserAllDetailsModel.fromJson(json.decode(str));

String currentUserAllDetailsModelToJson(CurrentUserAllDetailsModel data) => json.encode(data.toJson());

class CurrentUserAllDetailsModel {
    CurrentUserAllDetailsModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory CurrentUserAllDetailsModel.fromJson(Map<String, dynamic> json) => CurrentUserAllDetailsModel(
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
        this.tenetId,
        this.userName,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.dob,
        this.gender,
        this.userType,
        this.isDeleted,
        this.termsandCondition,
        this.profile,
    });

    int? id;
    int? userId;
    int? tenetId;
    String? userName;
    String? email;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    DateTime? dob;
    String? gender;
    String? userType;
    bool? isDeleted;
    bool? termsandCondition;
    List<Profile>? profile;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["userId"],
        tenetId: json["tenetId"],
        userName: json["userName"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        userType: json["userType"],
        isDeleted: json["isDeleted"],
        termsandCondition: json["termsandCondition"],
        profile: List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "tenetId": tenetId,
        "userName": userName,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "dob": dob!.toIso8601String(),
        "gender": gender,
        "userType": userType,
        "isDeleted": isDeleted,
        "termsandCondition": termsandCondition,
        "profile": List<dynamic>.from(profile!.map((x) => x.toJson())),
    };
}

class Profile {
    Profile({
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
        this.address,
    });

    int? id;
    int? userId;
    String? profileName;
    dynamic profileDescription;
    dynamic profileTags;
    dynamic profileSlug;
    dynamic prefferedCurrency;
    bool? isDeleted;
    dynamic fssaiNo;
    String? status;
    dynamic notificationToken;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;
    List<Address>? address;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    dynamic updatedBy;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
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
