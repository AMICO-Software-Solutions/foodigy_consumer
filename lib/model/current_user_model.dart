// To parse this JSON data, do
//
//     final currentUserDetailsModel = currentUserDetailsModelFromJson(jsonString);

import 'dart:convert';

CurrentUserDetailsModel currentUserDetailsModelFromJson(String str) => CurrentUserDetailsModel.fromJson(json.decode(str));

String currentUserDetailsModelToJson(CurrentUserDetailsModel data) => json.encode(data.toJson());

class CurrentUserDetailsModel {
    CurrentUserDetailsModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory CurrentUserDetailsModel.fromJson(Map<String, dynamic> json) => CurrentUserDetailsModel(
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
        this.username,
        this.email,
        this.phoneNo,
        this.name,
        this.roleId,
        this.details,
        this.resetFlag,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.providerId,
        this.provider,
        this.isEmailVerified,
        this.isPhoneNumberVerified,
        this.appId,
        this.userTypesId,
        this.serviceId,
    });

    int? id;
    String? username;
    String? email;
    String? phoneNo;
    String? name;
    dynamic roleId;
    dynamic details;
    String? resetFlag;
    DateTime? createdAt;
    String? createdBy;
    DateTime? updatedAt;
    dynamic updatedBy;
    dynamic providerId;
    dynamic provider;
    bool? isEmailVerified;
    dynamic isPhoneNumberVerified;
    dynamic appId;
    int? userTypesId;
    int? serviceId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phoneNo: json["phone_no"],
        name: json["name"],
        roleId: json["role_id"],
        details: json["details"],
        resetFlag: json["reset_flag"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        providerId: json["provider_id"],
        provider: json["provider"],
        isEmailVerified: json["is_email_verified"],
        isPhoneNumberVerified: json["is_phone_number_verified"],
        appId: json["app_id"],
        userTypesId: json["user_types_id"],
        serviceId: json["service_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone_no": phoneNo,
        "name": name,
        "role_id": roleId,
        "details": details,
        "reset_flag": resetFlag,
        "created_at": createdAt!.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt!.toIso8601String(),
        "updated_by": updatedBy,
        "provider_id": providerId,
        "provider": provider,
        "is_email_verified": isEmailVerified,
        "is_phone_number_verified": isPhoneNumberVerified,
        "app_id": appId,
        "user_types_id": userTypesId,
        "service_id": serviceId,
    };
}
