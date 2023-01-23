// To parse this JSON data, do
//
//     final paymentCartModel = paymentCartModelFromJson(jsonString);

import 'dart:convert';

List<PaymentCartModel> paymentCartModelFromJson(String str) => List<PaymentCartModel>.from(json.decode(str).map((x) => PaymentCartModel.fromJson(x)));

String paymentCartModelToJson(List<PaymentCartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentCartModel {
    PaymentCartModel({
        this.cartDetailsId,
        this.cartId,
        this.providerId,
        this.itemId,
        this.itemCost,
        this.itemName,
        this.currency,
        this.itemDesc,
        this.itemSlug,
        this.itemStatus,
        this.quantity,
        this.total,
        this.productTiming,
        this.productAvailableTime,
        this.orderCutOffTime,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.customization,
    });

    String? cartDetailsId;
    String? cartId;
    int? providerId;
    String? itemId;
    String? itemCost;
    String? itemName;
    String? currency;
    String? itemDesc;
    String? itemSlug;
    String? itemStatus;
    int? quantity;
    String? total;
    String? productTiming;
    String? productAvailableTime;
    dynamic orderCutOffTime;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    dynamic updatedBy;
    dynamic customization;

    factory PaymentCartModel.fromJson(Map<String, dynamic> json) => PaymentCartModel(
        cartDetailsId: json["cartDetailsId"],
        cartId: json["cartId"],
        providerId: json["providerId"],
        itemId: json["itemId"],
        itemCost: json["itemCost"],
        itemName: json["itemName"],
        currency: json["currency"],
        itemDesc: json["itemDesc"],
        itemSlug: json["itemSlug"],
        itemStatus: json["itemStatus"],
        quantity: json["quantity"],
        total: json["total"],
        productTiming: json["productTiming"],
        productAvailableTime: json["productAvailableTime"],
        orderCutOffTime: json["orderCutOffTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        customization: json["customization"],
    );

    Map<String, dynamic> toJson() => {
        "cartDetailsId": cartDetailsId,
        "cartId": cartId,
        "providerId": providerId,
        "itemId": itemId,
        "itemCost": itemCost,
        "itemName": itemName,
        "currency": currency,
        "itemDesc": itemDesc,
        "itemSlug": itemSlug,
        "itemStatus": itemStatus,
        "quantity": quantity,
        "total": total,
        "productTiming": productTiming,
        "productAvailableTime": productAvailableTime,
        "orderCutOffTime": orderCutOffTime,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "customization": customization,
    };
}
