// To parse this JSON data, do
//
//     final orderProductIdListModel = orderProductIdListModelFromJson(jsonString);

import 'dart:convert';

OrderProductIdListModel orderProductIdListModelFromJson(String str) => OrderProductIdListModel.fromJson(json.decode(str));

String orderProductIdListModelToJson(OrderProductIdListModel data) => json.encode(data.toJson());

class OrderProductIdListModel {
    OrderProductIdListModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory OrderProductIdListModel.fromJson(Map<String, dynamic> json) => OrderProductIdListModel(
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
        this.inventory,
        this.product,
        this.schedule,
        this.scheduleDetail,
    });

    Inventory? inventory;
    List<Product>? product;
    List<Schedule>? schedule;
    List<ScheduleDetail>? scheduleDetail;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        inventory: Inventory.fromJson(json["inventory"]),
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
        scheduleDetail: List<ScheduleDetail>.from(json["scheduleDetail"].map((x) => ScheduleDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "inventory": inventory!.toJson(),
        "product": List<dynamic>.from(product!.map((x) => x.toJson())),
        "schedule": List<dynamic>.from(schedule!.map((x) => x.toJson())),
        "scheduleDetail": List<dynamic>.from(scheduleDetail!.map((x) => x.toJson())),
    };
}

class Inventory {
    Inventory({
        this.id,
        this.userId,
        this.tenantId,
        this.title,
        this.description,
        this.prefferedCurrency,
        this.profileSlug,
        this.fssaiNo,
        this.type,
        this.invKind,
        this.active,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? id;
    int? userId;
    int? tenantId;
    String? title;
    String? description;
    String? prefferedCurrency;
    String? profileSlug;
    String? fssaiNo;
    String? type;
    String? invKind;
    bool? active;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        userId: json["userId"],
        tenantId: json["tenantId"],
        title: json["title"],
        description: json["description"],
        prefferedCurrency: json["prefferedCurrency"],
        profileSlug: json["profileSlug"],
        fssaiNo: json["fssaiNo"],
        type: json["type"],
        invKind: json["invKind"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "tenantId": tenantId,
        "title": title,
        "description": description,
        "prefferedCurrency": prefferedCurrency,
        "profileSlug": profileSlug,
        "fssaiNo": fssaiNo,
        "type": type,
        "invKind": invKind,
        "active": active,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}

class Product {
    Product({
        this.id,
        this.categoryId,
        this.inventoryId,
        this.productName,
        this.productDescription,
        this.healthTag,
        this.menuTag,
        this.productUnitPrice,
        this.natureofProduct,
        this.productType,
        this.productTiming,
        this.customizationStatus,
        this.productUnitOfMeasure,
        this.productUnits,
        this.productInStock,
        this.productStatus,
        this.productSize,
        this.productColour,
        this.productModel,
        this.productSlug,
        this.productAvatar,
        this.productDeliveryCharges,
        this.productConfig,
        this.productRatingCount,
        this.productAverageRating,
        this.instagramUrl,
        this.facebookUrl,
        this.twitterUrl,
        this.websiteorBlogUrl,
        this.productVerificationStatus,
        this.isDeleted,
        this.productAvailableTime,
        this.orderCutOffTime,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? id;
    int? categoryId;
    int? inventoryId;
    String? productName;
    String? productDescription;
    String? healthTag;
    String? menuTag;
    int? productUnitPrice;
    String? natureofProduct;
    String? productType;
    String? productTiming;
    bool? customizationStatus;
    int? productUnitOfMeasure;
    int? productUnits;
    int? productInStock;
    bool? productStatus;
    int? productSize;
    String? productColour;
    String? productModel;
    String? productSlug;
    String? productAvatar;
    int? productDeliveryCharges;
    ProductConfig? productConfig;
    dynamic productRatingCount;
    dynamic productAverageRating;
    String? instagramUrl;
    String? facebookUrl;
    String? twitterUrl;
    String? websiteorBlogUrl;
    String? productVerificationStatus;
    bool? isDeleted;
    String? productAvailableTime;
    String? orderCutOffTime;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    int? updatedBy;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["categoryId"],
        inventoryId: json["inventoryId"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        healthTag: json["healthTag"],
        menuTag: json["menuTag"],
        productUnitPrice: json["productUnitPrice"],
        natureofProduct: json["natureofProduct"],
        productType: json["productType"],
        productTiming: json["productTiming"],
        customizationStatus: json["customizationStatus"],
        productUnitOfMeasure: json["productUnitOfMeasure"],
        productUnits: json["productUnits"],
        productInStock: json["productInStock"],
        productStatus: json["productStatus"],
        productSize: json["productSize"],
        productColour: json["productColour"],
        productModel: json["productModel"],
        productSlug: json["productSlug"],
        productAvatar: json["productAvatar"],
        productDeliveryCharges: json["productDeliveryCharges"],
        productConfig: ProductConfig.fromJson(json["productConfig"]),
        productRatingCount: json["productRatingCount"],
        productAverageRating: json["productAverageRating"],
        instagramUrl: json["instagramUrl"],
        facebookUrl: json["facebookUrl"],
        twitterUrl: json["twitterUrl"],
        websiteorBlogUrl: json["websiteorBlogUrl"],
        productVerificationStatus: json["productVerificationStatus"],
        isDeleted: json["isDeleted"],
        productAvailableTime: json["productAvailableTime"],
        orderCutOffTime: json["orderCutOffTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "inventoryId": inventoryId,
        "productName": productName,
        "productDescription": productDescription,
        "healthTag": healthTag,
        "menuTag": menuTag,
        "productUnitPrice": productUnitPrice,
        "natureofProduct": natureofProduct,
        "productType": productType,
        "productTiming": productTiming,
        "customizationStatus": customizationStatus,
        "productUnitOfMeasure": productUnitOfMeasure,
        "productUnits": productUnits,
        "productInStock": productInStock,
        "productStatus": productStatus,
        "productSize": productSize,
        "productColour": productColour,
        "productModel": productModel,
        "productSlug": productSlug,
        "productAvatar": productAvatar,
        "productDeliveryCharges": productDeliveryCharges,
        "productConfig": productConfig!.toJson(),
        "productRatingCount": productRatingCount,
        "productAverageRating": productAverageRating,
        "instagramUrl": instagramUrl,
        "facebookUrl": facebookUrl,
        "twitterUrl": twitterUrl,
        "websiteorBlogUrl": websiteorBlogUrl,
        "productVerificationStatus": productVerificationStatus,
        "isDeleted": isDeleted,
        "productAvailableTime": productAvailableTime,
        "orderCutOffTime": orderCutOffTime,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}

class ProductConfig {
    ProductConfig();

    factory ProductConfig.fromJson(Map<String, dynamic> json) => ProductConfig(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Schedule {
    Schedule({
        this.scheduleId,
        this.invType,
        this.productId,
        this.serviceId,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.country,
        this.pincode,
        this.latitude,
        this.longitude,
        this.startDate,
        this.endDate,
        this.skipDays,
        this.isDeleted,
        this.updatedBy,
        this.showAddress,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
    });

    int? scheduleId;
    String? invType;
    int? productId;
    dynamic serviceId;
    String? address1;
    String? address2;
    String? city;
    String? state;
    String? country;
    int? pincode;
    double? latitude;
    double? longitude;
    DateTime? startDate;
    DateTime? endDate;
    String? skipDays;
    bool? isDeleted;
    dynamic updatedBy;
    bool? showAddress;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        scheduleId: json["scheduleId"],
        invType: json["invType"],
        productId: json["productId"],
        serviceId: json["serviceId"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        skipDays: json["skipDays"],
        isDeleted: json["isDeleted"],
        updatedBy: json["updatedBy"],
        showAddress: json["showAddress"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
    );

    Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "invType": invType,
        "productId": productId,
        "serviceId": serviceId,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
        "latitude": latitude,
        "longitude": longitude,
        "startDate": startDate!.toIso8601String(),
        "endDate": endDate!.toIso8601String(),
        "skipDays": skipDays,
        "isDeleted": isDeleted,
        "updatedBy": updatedBy,
        "showAddress": showAddress,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
    };
}

class ScheduleDetail {
    ScheduleDetail({
        this.id,
        this.scheduleId,
        this.startDateTime,
        this.endDateTime,
        this.region,
        this.slotAvailable,
        this.status,
        this.active,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? id;
    int? scheduleId;
    DateTime? startDateTime;
    DateTime? endDateTime;
    String? region;
    int? slotAvailable;
    String? status;
    bool? active;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;

    factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
        id: json["id"],
        scheduleId: json["scheduleId"],
        startDateTime: DateTime.parse(json["startDateTime"]),
        endDateTime: DateTime.parse(json["endDateTime"]),
        region: json["region"],
        slotAvailable: json["slotAvailable"],
        status: json["status"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "scheduleId": scheduleId,
        "startDateTime": startDateTime!.toIso8601String(),
        "endDateTime": endDateTime!.toIso8601String(),
        "region": region,
        "slotAvailable": slotAvailable,
        "status": status,
        "active": active,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}
