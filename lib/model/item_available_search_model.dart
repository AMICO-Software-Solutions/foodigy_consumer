// To parse this JSON data, do
//
//     final itemAvailableSearchFoodModel = itemAvailableSearchFoodModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

ItemAvailableSearchFoodModel itemAvailableSearchFoodModelFromJson(String str) => ItemAvailableSearchFoodModel.fromJson(json.decode(str));

String itemAvailableSearchFoodModelToJson(ItemAvailableSearchFoodModel data) => json.encode(data.toJson());

class ItemAvailableSearchFoodModel {
    ItemAvailableSearchFoodModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory ItemAvailableSearchFoodModel.fromJson(Map<String, dynamic> json) => ItemAvailableSearchFoodModel(
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
        this.profileName,
        this.profileDescription,
        this.prefferedCurrency,
        this.profileImage,
        this.userId,
        this.inventoryId,
        this.invType,
        this.address,
        this.city,
        this.productTitle,
        this.productDescription,
        this.productSlug,
        this.productCost,
        this.natureofProduct,
        this.productTiming,
        this.productId,
        this.menuTag,
        this.healthTag,
        this.availableCustomization,
        this.productAverageRating,
        this.productRatingCount,
        this.fssaiNo,
        this.productUnits,
        this.productAvailableTime,
        this.orderCutOffTime,
        this.showAddress,
        this.productStatus,
    });

    String? profileName;
    String? profileDescription;
    PrefferedCurrency? prefferedCurrency;
    String? profileImage;
    int? userId;
    int? inventoryId;
    InvType? invType;
    String? address;
    City? city;
    String? productTitle;
    String? productDescription;
    String? productSlug;
    int? productCost;
    NatureofProduct? natureofProduct;
    String? productTiming;
    int? productId;
    String? menuTag;
    String? healthTag;
    AvailableCustomization? availableCustomization;
    double? productAverageRating;
    String? productRatingCount;
    String? fssaiNo;
    int? productUnits;
    String? productAvailableTime;
    String? orderCutOffTime;
    bool? showAddress;
    bool? productStatus;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        profileName: json["profileName"],
        profileDescription: json["profileDescription"],
        prefferedCurrency: prefferedCurrencyValues.map[json["prefferedCurrency"]],
        profileImage: json["profileImage"],
        userId: json["userId"],
        inventoryId: json["inventoryId"],
        invType: invTypeValues.map[json["invType"]],
        address: json["address"],
        city: cityValues.map[json["city"]],
        productTitle: json["productTitle"],
        productDescription: json["productDescription"],
        productSlug: json["productSlug"],
        productCost: json["productCost"],
        natureofProduct: natureofProductValues.map[json["natureofProduct"]],
        productTiming: json["productTiming"],
        productId: json["productId"],
        menuTag: json["menuTag"],
        healthTag: json["healthTag"],
        availableCustomization: AvailableCustomization.fromJson(json["availableCustomization"]),
        productAverageRating: json["productAverageRating"] == null ? null : json["productAverageRating"].toDouble(),
        productRatingCount: json["productRatingCount"] == null ? null : json["productRatingCount"],
        fssaiNo: json["fssaiNo"] == null ? null : json["fssaiNo"],
        productUnits: json["productUnits"],
        productAvailableTime: json["productAvailableTime"],
        orderCutOffTime: json["orderCutOffTime"] == null ? null : json["orderCutOffTime"],
        showAddress: json["showAddress"],
        productStatus: json["productStatus"],
    );

    Map<String, dynamic> toJson() => {
        "profileName": profileName,
        "profileDescription": profileDescription,
        "prefferedCurrency": prefferedCurrencyValues.reverse[prefferedCurrency],
        "profileImage": profileImage,
        "userId": userId,
        "inventoryId": inventoryId,
        "invType": invTypeValues.reverse[invType],
        "address": address,
        "city": cityValues.reverse[city],
        "productTitle": productTitle,
        "productDescription": productDescription,
        "productSlug": productSlug,
        "productCost": productCost,
        "natureofProduct": natureofProductValues.reverse[natureofProduct],
        "productTiming": productTiming,
        "productId": productId,
        "menuTag": menuTag,
        "healthTag": healthTag,
        "availableCustomization": availableCustomization!.toJson(),
        "productAverageRating": productAverageRating == null ? null : productAverageRating,
        "productRatingCount": productRatingCount == null ? null : productRatingCount,
        "fssaiNo": fssaiNo == null ? null : fssaiNo,
        "productUnits": productUnits,
        "productAvailableTime": productAvailableTimeValues.reverse[productAvailableTime],
        "orderCutOffTime": orderCutOffTime == null ? null : orderCutOffTime,
        "showAddress": showAddress,
        "productStatus": productStatus,
    };
}

class AvailableCustomization {
    AvailableCustomization({
        this.custom,
    });

    List<Custom>? custom;

    factory AvailableCustomization.fromJson(Map<String, dynamic> json) => AvailableCustomization(
        custom: List<Custom>.from(json["custom"].map((x) => Custom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "custom": List<dynamic>.from(custom!.map((x) => x.toJson())),
    };
}

class Custom {
    Custom({
        this.id,
        this.name,
        this.status,
    });

    int? id;
    String? name;
    bool? status;

    factory Custom.fromJson(Map<String, dynamic> json) => Custom(
        id: json["id"],
        name: json["name"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status == null ? null : status,
    };
}

enum City { CHENNAI }

final cityValues = EnumValues({
    "Chennai": City.CHENNAI
});

enum InvType { PRODUCT }

final invTypeValues = EnumValues({
    "product": InvType.PRODUCT
});

enum NatureofProduct { NONVEG, VEG }

final natureofProductValues = EnumValues({
    "nonveg": NatureofProduct.NONVEG,
    "Veg": NatureofProduct.VEG
});

enum PrefferedCurrency { INR }

final prefferedCurrencyValues = EnumValues({
    "INR": PrefferedCurrency.INR
});

enum ProductAvailableTime { THE_800_AM, THE_1000_AM }

final productAvailableTimeValues = EnumValues({
    "10:00 AM": ProductAvailableTime.THE_1000_AM,
    "8:00 AM": ProductAvailableTime.THE_800_AM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
