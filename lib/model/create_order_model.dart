// To parse this JSON data, do
//
//     final createOrderModel = createOrderModelFromJson(jsonString);

import 'dart:convert';

CreateOrderModel createOrderModelFromJson(String str) => CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) => json.encode(data.toJson());

class CreateOrderModel {
    CreateOrderModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory CreateOrderModel.fromJson(Map<String, dynamic> json) => CreateOrderModel(
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
        this.response,
        this.orderCreatedData,
    });

    Response? response;
    OrderCreatedData? orderCreatedData;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        response: Response.fromJson(json["response"]),
        orderCreatedData: OrderCreatedData.fromJson(json["orderCreatedData"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response!.toJson(),
        "orderCreatedData": orderCreatedData!.toJson(),
    };
}

class OrderCreatedData {
    OrderCreatedData({
        this.orderId,
        this.tenantId,
        this.providerId,
        this.consumerId,
        this.addressId,
        this.profileName,
        this.profileSlug,
        this.orderStatus,
        this.orderType,
        this.bookingDate,
        this.couponId,
        this.couponCode,
        this.prefferedCurrency,
        this.sgstCost,
        this.sgstPercent,
        this.cgstCost,
        this.cgstPercent,
        this.taxTotalCost,
        this.productTotalCost,
        this.couponCost,
        this.totalCost,
        this.orderAddress,
        this.invoiceAddress,
        this.phoneNumber,
        this.email,
        this.orderPlacedTime,
        this.acceptedTime,
        this.rejectedTime,
        this.readyForDeliverTime,
        this.deliveredTime,
        this.cancelledTime,
        this.cancelledByDeliveryAgentDateTime,
        this.commissionCost,
        this.payToProviderId,
        this.additionalNote,
        this.reviewStatus,
        this.cancelOrderStatus,
        this.orderRejectReason,
        this.oneTimePassword,
        this.otpExpiryDateTime,
        this.deliveryMode,
        this.deliveryRate,
        this.paymentCapturedDateTime,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? orderId;
    int? tenantId;
    int? providerId;
    int? consumerId;
    int? addressId;
    String? profileName;
    String? profileSlug;
    String? orderStatus;
    String? orderType;
    DateTime? bookingDate;
    dynamic couponId;
    dynamic couponCode;
    String? prefferedCurrency;
    String? sgstCost;
    String? sgstPercent;
    String? cgstCost;
    String? cgstPercent;
    String? taxTotalCost;
    String? productTotalCost;
    dynamic couponCost;
    String? totalCost;
    String? orderAddress;
    String? invoiceAddress;
    String? phoneNumber;
    String? email;
    DateTime? orderPlacedTime;
    dynamic acceptedTime;
    dynamic rejectedTime;
    dynamic readyForDeliverTime;
    dynamic deliveredTime;
    dynamic cancelledTime;
    dynamic cancelledByDeliveryAgentDateTime;
    String? commissionCost;
    dynamic payToProviderId;
    String? additionalNote;
    bool? reviewStatus;
    bool? cancelOrderStatus;
    dynamic orderRejectReason;
    dynamic oneTimePassword;
    dynamic otpExpiryDateTime;
    String? deliveryMode;
    String? deliveryRate;
    dynamic paymentCapturedDateTime;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    dynamic updatedBy;

    factory OrderCreatedData.fromJson(Map<String, dynamic> json) => OrderCreatedData(
        orderId: json["orderId"],
        tenantId: json["tenantId"],
        providerId: json["providerId"],
        consumerId: json["consumerId"],
        addressId: json["addressId"],
        profileName: json["profileName"],
        profileSlug: json["profileSlug"],
        orderStatus: json["orderStatus"],
        orderType: json["orderType"],
        bookingDate: DateTime.parse(json["bookingDate"]),
        couponId: json["couponId"],
        couponCode: json["couponCode"],
        prefferedCurrency: json["prefferedCurrency"],
        sgstCost: json["sgstCost"],
        sgstPercent: json["sgstPercent"],
        cgstCost: json["cgstCost"],
        cgstPercent: json["cgstPercent"],
        taxTotalCost: json["taxTotalCost"],
        productTotalCost: json["productTotalCost"],
        couponCost: json["couponCost"],
        totalCost: json["totalCost"],
        orderAddress: json["orderAddress"],
        invoiceAddress: json["invoiceAddress"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        orderPlacedTime: DateTime.parse(json["orderPlacedTime"]),
        acceptedTime: json["acceptedTime"],
        rejectedTime: json["rejectedTime"],
        readyForDeliverTime: json["readyForDeliverTime"],
        deliveredTime: json["deliveredTime"],
        cancelledTime: json["cancelledTime"],
        cancelledByDeliveryAgentDateTime: json["cancelledByDeliveryAgentDateTime"],
        commissionCost: json["commissionCost"],
        payToProviderId: json["payToProviderId"],
        additionalNote: json["additionalNote"],
        reviewStatus: json["reviewStatus"],
        cancelOrderStatus: json["cancelOrderStatus"],
        orderRejectReason: json["orderRejectReason"],
        oneTimePassword: json["oneTimePassword"],
        otpExpiryDateTime: json["otpExpiryDateTime"],
        deliveryMode: json["deliveryMode"],
        deliveryRate: json["deliveryRate"],
        paymentCapturedDateTime: json["paymentCapturedDateTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "tenantId": tenantId,
        "providerId": providerId,
        "consumerId": consumerId,
        "addressId": addressId,
        "profileName": profileName,
        "profileSlug": profileSlug,
        "orderStatus": orderStatus,
        "orderType": orderType,
        "bookingDate": bookingDate!.toIso8601String(),
        "couponId": couponId,
        "couponCode": couponCode,
        "prefferedCurrency": prefferedCurrency,
        "sgstCost": sgstCost,
        "sgstPercent": sgstPercent,
        "cgstCost": cgstCost,
        "cgstPercent": cgstPercent,
        "taxTotalCost": taxTotalCost,
        "productTotalCost": productTotalCost,
        "couponCost": couponCost,
        "totalCost": totalCost,
        "orderAddress": orderAddress,
        "invoiceAddress": invoiceAddress,
        "phoneNumber": phoneNumber,
        "email": email,
        "orderPlacedTime": orderPlacedTime!.toIso8601String(),
        "acceptedTime": acceptedTime,
        "rejectedTime": rejectedTime,
        "readyForDeliverTime": readyForDeliverTime,
        "deliveredTime": deliveredTime,
        "cancelledTime": cancelledTime,
        "cancelledByDeliveryAgentDateTime": cancelledByDeliveryAgentDateTime,
        "commissionCost": commissionCost,
        "payToProviderId": payToProviderId,
        "additionalNote": additionalNote,
        "reviewStatus": reviewStatus,
        "cancelOrderStatus": cancelOrderStatus,
        "orderRejectReason": orderRejectReason,
        "oneTimePassword": oneTimePassword,
        "otpExpiryDateTime": otpExpiryDateTime,
        "deliveryMode": deliveryMode,
        "deliveryRate": deliveryRate,
        "paymentCapturedDateTime": paymentCapturedDateTime,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}

class Response {
    Response({
        this.key,
        this.amount,
        this.currency,
        this.name,
        this.image,
        this.orderId,
        this.callbackUrl,
        this.prefill,
        this.notes,
        this.theme,
    });

    String? key;
    String? amount;
    String? currency;
    String? name;
    String? image;
    String? orderId;
    String? callbackUrl;
    Prefill? prefill;
    Notes? notes;
    Theme? theme;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        key: json["key"],
        amount: json["amount"],
        currency: json["currency"],
        name: json["name"],
        image: json["image"],
        orderId: json["order_id"],
        callbackUrl: json["callback_url"],
        prefill: Prefill.fromJson(json["prefill"]),
        notes: Notes.fromJson(json["notes"]),
        theme: Theme.fromJson(json["theme"]),
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "amount": amount,
        "currency": currency,
        "name": name,
        "image": image,
        "order_id": orderId,
        "callback_url": callbackUrl,
        "prefill": prefill!.toJson(),
        "notes": notes!.toJson(),
        "theme": theme!.toJson(),
    };
}

class Notes {
    Notes({
        this.address,
        this.orderId,
        this.consumerId,
    });

    String? address;
    int? orderId;
    int? consumerId;

    factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        address: json["address"],
        orderId: json["orderId"],
        consumerId: json["consumerId"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "orderId": orderId,
        "consumerId": consumerId,
    };
}

class Prefill {
    Prefill({
        this.email,
        this.contact,
    });

    String? email;
    String? contact;

    factory Prefill.fromJson(Map<String, dynamic> json) => Prefill(
        email: json["email"],
        contact: json["contact"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "contact": contact,
    };
}

class Theme {
    Theme({
        this.color,
    });

    String? color;

    factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
    };
}
