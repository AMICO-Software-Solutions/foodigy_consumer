// To parse this JSON data, do
//
//     final pickDropModel = pickDropModelFromJson(jsonString);

import 'dart:convert';

PickDropModel pickDropModelFromJson(String str) => PickDropModel.fromJson(json.decode(str));

String pickDropModelToJson(PickDropModel data) => json.encode(data.toJson());

class PickDropModel {
    PickDropModel({
        this.packageStatus,
        this.deliveryCharge,
    });

    String? packageStatus;
    double? deliveryCharge;

    factory PickDropModel.fromJson(Map<String, dynamic> json) => PickDropModel(
        packageStatus: json["packageStatus"],
        deliveryCharge: json["deliveryCharge"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "packageStatus": packageStatus,
        "deliveryCharge": deliveryCharge,
    };
}
