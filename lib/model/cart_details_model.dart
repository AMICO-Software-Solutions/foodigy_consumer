// To parse this JSON data, do
//
//     final cartDetailsModel = cartDetailsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators



// To parse this JSON data, do
//
//     final cartDetailsModel = cartDetailsModelFromJson(jsonString);

import 'dart:convert';

CartDetailsModel cartDetailsModelFromJson(String str) => CartDetailsModel.fromJson(json.decode(str));

String cartDetailsModelToJson(CartDetailsModel data) => json.encode(data.toJson());

class CartDetailsModel {
    CartDetailsModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory CartDetailsModel.fromJson(Map<String, dynamic> json) => CartDetailsModel(
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
        this.tenantId,
        this.userId,
        this.cartId,
        this.cartValue,
        this.itemCount,
        this.modifiedDate,
        this.cartStatus,
        this.status,
        this.profileName,
        this.profileSlug,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.cartDetails,
    });

    int? tenantId;
    int? userId;
    String? cartId;
    String? cartValue;
    int? itemCount;
    DateTime? modifiedDate;
    String? cartStatus;
    String? status;
    String? profileName;
    String? profileSlug;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    dynamic updatedBy;
    List<CartDetail>? cartDetails;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tenantId: json["tenantId"] == null ? null : json["tenantId"],
        userId: json["userId"] == null ? null : json["userId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        cartValue: json["cartValue"] == null ? null : json["cartValue"],
        itemCount: json["itemCount"] == null ? null : json["itemCount"],
        modifiedDate: json["modifiedDate"] == null ? null : DateTime.parse(json["modifiedDate"]),
        cartStatus: json["cartStatus"] == null ? null : json["cartStatus"],
        status: json["status"] == null ? null : json["status"],
        profileName: json["profileName"] == null ? null : json["profileName"],
        profileSlug: json["profileSlug"] == null ? null : json["profileSlug"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
        cartDetails: json["cartDetails"] == null ? null : List<CartDetail>.from(json["cartDetails"].map((x) => CartDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tenantId": tenantId == null ? null : tenantId,
        "userId": userId == null ? null : userId,
        "cartId": cartId == null ? null : cartId,
        "cartValue": cartValue == null ? null : cartValue,
        "itemCount": itemCount == null ? null : itemCount,
        "modifiedDate": modifiedDate == null ? null : modifiedDate!.toIso8601String(),
        "cartStatus": cartStatus == null ? null : cartStatus,
        "status": status == null ? null : status,
        "profileName": profileName == null ? null : profileName,
        "profileSlug": profileSlug == null ? null : profileSlug,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
        "cartDetails": cartDetails == null ? null : List<dynamic>.from(cartDetails!.map((x) => x.toJson())),
    };
}

class CartDetail {
    CartDetail({
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
    CartDetailCustomization? customization;

    factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        cartDetailsId: json["cartDetailsId"] == null ? null : json["cartDetailsId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        providerId: json["providerId"] == null ? null : json["providerId"],
        itemId: json["itemId"] == null ? null : json["itemId"],
        itemCost: json["itemCost"] == null ? null : json["itemCost"],
        itemName: json["itemName"] == null ? null : json["itemName"],
        currency: json["currency"] == null ? null : json["currency"],
        itemDesc: json["itemDesc"] == null ? null : json["itemDesc"],
        itemSlug: json["itemSlug"] == null ? null : json["itemSlug"],
        itemStatus: json["itemStatus"] == null ? null : json["itemStatus"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        total: json["total"] == null ? null : json["total"],
        productTiming: json["productTiming"] == null ? null : json["productTiming"],
        productAvailableTime: json["productAvailableTime"] == null ? null : json["productAvailableTime"],
        orderCutOffTime: json["orderCutOffTime"] == null ? null : json["orderCutOffTime"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
        customization: json["customization"] == null ? null : CartDetailCustomization.fromJson(json["customization"]),
    );

    Map<String, dynamic> toJson() => {
        "cartDetailsId": cartDetailsId == null ? null : cartDetailsId,
        "cartId": cartId == null ? null : cartId,
        "providerId": providerId == null ? null : providerId,
        "itemId": itemId == null ? null : itemId,
        "itemCost": itemCost == null ? null : itemCost,
        "itemName": itemName == null ? null : itemName,
        "currency": currency == null ? null : currency,
        "itemDesc": itemDesc == null ? null : itemDesc,
        "itemSlug": itemSlug == null ? null : itemSlug,
        "itemStatus": itemStatus == null ? null : itemStatus,
        "quantity": quantity == null ? null : quantity,
        "total": total == null ? null : total,
        "productTiming": productTiming == null ? null : productTiming,
        "productAvailableTime": productAvailableTime == null ? null : productAvailableTime,
        "orderCutOffTime": orderCutOffTime == null ? null : orderCutOffTime,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
        "customization": customization == null ? null : customization!.toJson(),
    };
}

class CartDetailCustomization {
    CartDetailCustomization({
        this.customizationId,
        this.cartDetailsId,
        this.orderdetailId,
        this.customization,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? customizationId;
    String? cartDetailsId;
    dynamic orderdetailId;
    CustomizationCustomization? customization;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;

    factory CartDetailCustomization.fromJson(Map<String, dynamic> json) => CartDetailCustomization(
        customizationId: json["customizationId"] == null ? null : json["customizationId"],
        cartDetailsId: json["cartDetailsId"] == null ? null : json["cartDetailsId"],
        orderdetailId: json["orderdetailId"],
        customization: json["customization"] == null ? null : CustomizationCustomization.fromJson(json["customization"]),
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "customizationId": customizationId == null ? null : customizationId,
        "cartDetailsId": cartDetailsId == null ? null : cartDetailsId,
        "orderdetailId": orderdetailId,
        "customization": customization == null ? null : customization!.toJson(),
        "isDeleted": isDeleted == null ? null : isDeleted,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
    };
}

class CustomizationCustomization {
    CustomizationCustomization({
        this.custom,
    });

    List<Custom>? custom;

    factory CustomizationCustomization.fromJson(Map<String, dynamic> json) => CustomizationCustomization(
        custom: json["custom"] == null ? null : List<Custom>.from(json["custom"].map((x) => Custom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "custom": custom == null ? null : List<dynamic>.from(custom!.map((x) => x.toJson())),
    };
}

class Custom {
    Custom({
        this.id,
        this.name,
    });

    String? id;
    String? name;

    factory Custom.fromJson(Map<String, dynamic> json) => Custom(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}




/*
import 'dart:convert';

CartDetailsModel cartDetailsModelFromJson(String str) => CartDetailsModel.fromJson(json.decode(str));

String cartDetailsModelToJson(CartDetailsModel data) => json.encode(data.toJson());

class CartDetailsModel {
    CartDetailsModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory CartDetailsModel.fromJson(Map<String, dynamic> json) => CartDetailsModel(
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
        this.tenantId,
        this.userId,
        this.cartId,
        this.cartValue,
        this.itemCount,
        this.modifiedDate,
        this.cartStatus,
        this.status,
        this.profileName,
        this.profileSlug,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.cartDetails,
    });

    int? tenantId;
    int? userId;
    String? cartId;
    String? cartValue;
    int? itemCount;
    DateTime? modifiedDate;
    String? cartStatus;
    String? status;
    String? profileName;
    String? profileSlug;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;
    List<CartDetail>? cartDetails;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tenantId: json["tenantId"] == null ? null : json["tenantId"],
        userId: json["userId"] == null ? null : json["userId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        cartValue: json["cartValue"] == null ? null : json["cartValue"],
        itemCount: json["itemCount"] == null ? null : json["itemCount"],
        modifiedDate: json["modifiedDate"] == null ? null : DateTime.parse(json["modifiedDate"]),
        cartStatus: json["cartStatus"] == null ? null : json["cartStatus"],
        status: json["status"] == null ? null : json["status"],
        profileName: json["profileName"] == null ? null : json["profileName"],
        profileSlug: json["profileSlug"] == null ? null : json["profileSlug"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
        cartDetails: json["cartDetails"] == null ? null : List<CartDetail>.from(json["cartDetails"].map((x) => CartDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tenantId": tenantId == null ? null : tenantId,
        "userId": userId == null ? null : userId,
        "cartId": cartId == null ? null : cartId,
        "cartValue": cartValue == null ? null : cartValue,
        "itemCount": itemCount == null ? null : itemCount,
        "modifiedDate": modifiedDate == null ? null : modifiedDate!.toIso8601String(),
        "cartStatus": cartStatus == null ? null : cartStatus,
        "status": status == null ? null : status,
        "profileName": profileName == null ? null : profileName,
        "profileSlug": profileSlug == null ? null : profileSlug,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy == null ? null : updatedBy,
        "cartDetails": cartDetails == null ? null : List<dynamic>.from(cartDetails!.map((x) => x.toJson())),
    };
}

class CartDetail {
    CartDetail({
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
    dynamic? updatedBy;
    CartDetailCustomization? customization;

    factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        cartDetailsId: json["cartDetailsId"] == null ? null : json["cartDetailsId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        providerId: json["providerId"] == null ? null : json["providerId"],
        itemId: json["itemId"] == null ? null : json["itemId"],
        itemCost: json["itemCost"] == null ? null : json["itemCost"],
        itemName: json["itemName"] == null ? null : json["itemName"],
        currency: json["currency"] == null ? null : json["currency"],
        itemDesc: json["itemDesc"] == null ? null : json["itemDesc"],
        itemSlug: json["itemSlug"] == null ? null : json["itemSlug"],
        itemStatus: json["itemStatus"] == null ? null : json["itemStatus"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        total: json["total"] == null ? null : json["total"],
        productTiming: json["productTiming"] == null ? null : json["productTiming"],
        productAvailableTime: json["productAvailableTime"] == null ? null : json["productAvailableTime"],
        orderCutOffTime: json["orderCutOffTime"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
        customization: json["customization"] == null ? null : CartDetailCustomization.fromJson(json["customization"]),
    );

    Map<String, dynamic> toJson() => {
        "cartDetailsId": cartDetailsId == null ? null : cartDetailsId,
        "cartId": cartId == null ? null : cartId,
        "providerId": providerId == null ? null : providerId,
        "itemId": itemId == null ? null : itemId,
        "itemCost": itemCost == null ? null : itemCost,
        "itemName": itemName == null ? null : itemName,
        "currency": currency == null ? null : currency,
        "itemDesc": itemDesc == null ? null : itemDesc,
        "itemSlug": itemSlug == null ? null : itemSlug,
        "itemStatus": itemStatus == null ? null : itemStatus,
        "quantity": quantity == null ? null : quantity,
        "total": total == null ? null : total,
        "productTiming": productTiming == null ? null : productTiming,
        "productAvailableTime": productAvailableTime == null ? null : productAvailableTime,
        "orderCutOffTime": orderCutOffTime,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
        "customization": customization == null ? null : customization!.toJson(),
    };
}

class CartDetailCustomization {
    CartDetailCustomization({
        this.customizationId,
        this.cartDetailsId,
        this.orderdetailId,
        this.customization,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? customizationId;
    String? cartDetailsId;
    dynamic orderdetailId;
    CustomizationCustomization? customization;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;

    factory CartDetailCustomization.fromJson(Map<String, dynamic> json) => CartDetailCustomization(
        customizationId: json["customizationId"] == null ? null : json["customizationId"],
        cartDetailsId: json["cartDetailsId"] == null ? null : json["cartDetailsId"],
        orderdetailId: json["orderdetailId"],
        customization: json["customization"] == null ? null : CustomizationCustomization.fromJson(json["customization"]),
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "customizationId": customizationId == null ? null : customizationId,
        "cartDetailsId": cartDetailsId == null ? null : cartDetailsId,
        "orderdetailId": orderdetailId,
        "customization": customization == null ? null : customization!.toJson(),
        "isDeleted": isDeleted == null ? null : isDeleted,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
    };
}

class CustomizationCustomization {
    CustomizationCustomization({
        this.custom,
    });

    List<String>? custom;

    factory CustomizationCustomization.fromJson(Map<String, dynamic> json) => CustomizationCustomization(
        custom: json["custom"] == null ? null : List<String>.from(json["custom"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "custom": custom == null ? null : List<dynamic>.from(custom!.map((x) => x)),
    };
}
*/