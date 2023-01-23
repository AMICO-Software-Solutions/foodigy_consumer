// To parse this JSON data, do
//
//     final chefDetailsModelList = chefDetailsModelListFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ChefDetailsModelList chefDetailsModelListFromJson(String str) => ChefDetailsModelList.fromJson(json.decode(str));

String chefDetailsModelListToJson(ChefDetailsModelList data) => json.encode(data.toJson());

class ChefDetailsModelList {
    ChefDetailsModelList({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory ChefDetailsModelList.fromJson(Map<String, dynamic> json) => ChefDetailsModelList(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    String? prefferedCurrency;
    String? profileImage;
    int? userId;
    int? inventoryId;
    String? invType;
    String? address;
    String? city;
    String? productTitle;
    String? productDescription;
    String? productSlug;
    int? productCost;
    String? natureofProduct;
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
        profileName: json["profileName"] == null ? null : json["profileName"],
        profileDescription: json["profileDescription"] == null ? null : json["profileDescription"],
        prefferedCurrency: json["prefferedCurrency"] == null ? null : json["prefferedCurrency"],
        profileImage: json["profileImage"] == null ? null : json["profileImage"],
        userId: json["userId"] == null ? null : json["userId"],
        inventoryId: json["inventoryId"] == null ? null : json["inventoryId"],
        invType: json["invType"] == null ? null : json["invType"],
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
        productTitle: json["productTitle"] == null ? null : json["productTitle"],
        productDescription: json["productDescription"] == null ? null : json["productDescription"],
        productSlug: json["productSlug"] == null ? null : json["productSlug"],
        productCost: json["productCost"] == null ? null : json["productCost"],
        natureofProduct: json["natureofProduct"] == null ? null : json["natureofProduct"],
        productTiming: json["productTiming"] == null ? null : json["productTiming"],
        productId: json["productId"] == null ? null : json["productId"],
        menuTag: json["menuTag"] == null ? null : json["menuTag"],
        healthTag: json["healthTag"] == null ? null : json["healthTag"],
        availableCustomization: json["availableCustomization"] == null ? null : AvailableCustomization.fromJson(json["availableCustomization"]),
        productAverageRating: json["productAverageRating"] == null ? null : json["productAverageRating"]!.toDouble(),
        productRatingCount: json["productRatingCount"] == null ? null : json["productRatingCount"],
        fssaiNo: json["fssaiNo"] == null ? null : json["fssaiNo"],
        productUnits: json["productUnits"] == null ? null : json["productUnits"],
        productAvailableTime: json["productAvailableTime"] == null ? null : json["productAvailableTime"],
        orderCutOffTime: json["orderCutOffTime"] == null ? null : json["orderCutOffTime"],
        showAddress: json["showAddress"] == null ? null : json["showAddress"],
        productStatus: json["productStatus"] == null ? null : json["productStatus"],
    );

    Map<String, dynamic> toJson() => {
        "profileName": profileName == null ? null : profileName,
        "profileDescription": profileDescription == null ? null : profileDescription,
        "prefferedCurrency": prefferedCurrency == null ? null : prefferedCurrency,
        "profileImage": profileImage == null ? null : profileImage,
        "userId": userId == null ? null : userId,
        "inventoryId": inventoryId == null ? null : inventoryId,
        "invType": invType == null ? null : invType,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "productTitle": productTitle == null ? null : productTitle,
        "productDescription": productDescription == null ? null : productDescription,
        "productSlug": productSlug == null ? null : productSlug,
        "productCost": productCost == null ? null : productCost,
        "natureofProduct": natureofProduct == null ? null : natureofProduct,
        "productTiming": productTiming == null ? null : productTiming,
        "productId": productId == null ? null : productId,
        "menuTag": menuTag == null ? null : menuTag,
        "healthTag": healthTag == null ? null : healthTag,
        "availableCustomization": availableCustomization == null ? null : availableCustomization!.toJson(),
        "productAverageRating": productAverageRating == null ? null : productAverageRating,
        "productRatingCount": productRatingCount == null ? null : productRatingCount,
        "fssaiNo": fssaiNo == null ? null : fssaiNo,
        "productUnits": productUnits == null ? null : productUnits,
        "productAvailableTime": productAvailableTime == null ? null : productAvailableTime,
        "orderCutOffTime": orderCutOffTime == null ? null : orderCutOffTime,
        "showAddress": showAddress == null ? null : showAddress,
        "productStatus": productStatus == null ? null : productStatus,
    };
}

class AvailableCustomization {
    AvailableCustomization({
        this.custom,
    });

    List<Custom>? custom;

    factory AvailableCustomization.fromJson(Map<String, dynamic> json) => AvailableCustomization(
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

    int? id;
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
