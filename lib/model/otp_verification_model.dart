// To parse this JSON data, do
//
//     final otpVerificationCodeModel = otpVerificationCodeModelFromJson(jsonString);

import 'dart:convert';

OtpVerificationCodeModel otpVerificationCodeModelFromJson(String str) => OtpVerificationCodeModel.fromJson(json.decode(str));

String otpVerificationCodeModelToJson(OtpVerificationCodeModel data) => json.encode(data.toJson());

class OtpVerificationCodeModel {
    OtpVerificationCodeModel({
        this.message,
        this.trxDetails,
    });

    String? message;
    TrxDetails? trxDetails;

    factory OtpVerificationCodeModel.fromJson(Map<String, dynamic> json) => OtpVerificationCodeModel(
        message: json["message"],
        trxDetails: TrxDetails.fromJson(json["trx_details"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "trx_details": trxDetails!.toJson(),
    };
}

class TrxDetails {
    TrxDetails({
        this.trxId,
        this.otpCode,
        this.usersId,
        this.expDateTime,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.createdAt,
        this.id,
    });

    String? trxId;
    int? otpCode;
    int? usersId;
    DateTime? expDateTime;
    String? createdBy;
    DateTime? updatedAt;
    String? updatedBy;
    DateTime? createdAt;
    int? id;

    factory TrxDetails.fromJson(Map<String, dynamic> json) => TrxDetails(
        trxId: json["trx_id"],
        otpCode: json["otp_code"],
        usersId: json["users_id"],
        expDateTime: DateTime.parse(json["exp_date_time"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "trx_id": trxId,
        "otp_code": otpCode,
        "users_id": usersId,
        "exp_date_time": expDateTime!.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt!.toIso8601String(),
        "updated_by": updatedBy,
        "created_at": createdAt!.toIso8601String(),
        "id": id,
    };
}
