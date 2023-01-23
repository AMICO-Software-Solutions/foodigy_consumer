// To parse this JSON data, do
//
//     final orderCompleteApiModel = orderCompleteApiModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

OrderCompleteApiModel orderCompleteApiModelFromJson(String str) => OrderCompleteApiModel.fromJson(json.decode(str));

String orderCompleteApiModelToJson(OrderCompleteApiModel data) => json.encode(data.toJson());

class OrderCompleteApiModel {
    OrderCompleteApiModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory OrderCompleteApiModel.fromJson(Map<String, dynamic> json) => OrderCompleteApiModel(
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
        this.deliveryType,
        this.orderDetail,
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
    String? couponCost;
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
    DateTime? paymentCapturedDateTime;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    dynamic updatedBy;
    List<dynamic>? deliveryType;
    List<OrderDetail>? orderDetail;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["orderId"] == null ? null : json["orderId"],
        tenantId: json["tenantId"] == null ? null : json["tenantId"],
        providerId: json["providerId"] == null ? null : json["providerId"],
        consumerId: json["consumerId"] == null ? null : json["consumerId"],
        addressId: json["addressId"] == null ? null : json["addressId"],
        profileName: json["profileName"] == null ? null : json["profileName"],
        profileSlug: json["profileSlug"] == null ? null : json["profileSlug"],
        orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
        orderType: json["orderType"] == null ? null : json["orderType"],
        bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
        couponId: json["couponId"],
        couponCode: json["couponCode"],
        prefferedCurrency: json["prefferedCurrency"] == null ? null : json["prefferedCurrency"],
        sgstCost: json["sgstCost"] == null ? null : json["sgstCost"],
        sgstPercent: json["sgstPercent"] == null ? null : json["sgstPercent"],
        cgstCost: json["cgstCost"] == null ? null : json["cgstCost"],
        cgstPercent: json["cgstPercent"] == null ? null : json["cgstPercent"],
        taxTotalCost: json["taxTotalCost"] == null ? null : json["taxTotalCost"],
        productTotalCost: json["productTotalCost"] == null ? null : json["productTotalCost"],
        couponCost: json["couponCost"] == null ? null : json["couponCost"],
        totalCost: json["totalCost"] == null ? null : json["totalCost"],
        orderAddress: json["orderAddress"] == null ? null : json["orderAddress"],
        invoiceAddress: json["invoiceAddress"] == null ? null : json["invoiceAddress"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
        orderPlacedTime: json["orderPlacedTime"] == null ? null : DateTime.parse(json["orderPlacedTime"]),
        acceptedTime: json["acceptedTime"],
        rejectedTime: json["rejectedTime"],
        readyForDeliverTime: json["readyForDeliverTime"],
        deliveredTime: json["deliveredTime"],
        cancelledTime: json["cancelledTime"],
        cancelledByDeliveryAgentDateTime: json["cancelledByDeliveryAgentDateTime"],
        commissionCost: json["commissionCost"] == null ? null : json["commissionCost"],
        payToProviderId: json["payToProviderId"],
        additionalNote: json["additionalNote"] == null ? null : json["additionalNote"],
        reviewStatus: json["reviewStatus"] == null ? null : json["reviewStatus"],
        cancelOrderStatus: json["cancelOrderStatus"] == null ? null : json["cancelOrderStatus"],
        orderRejectReason: json["orderRejectReason"],
        oneTimePassword: json["oneTimePassword"],
        otpExpiryDateTime: json["otpExpiryDateTime"],
        deliveryMode: json["deliveryMode"] == null ? null : json["deliveryMode"],
        deliveryRate: json["deliveryRate"] == null ? null : json["deliveryRate"],
        paymentCapturedDateTime: json["paymentCapturedDateTime"] == null ? null : DateTime.parse(json["paymentCapturedDateTime"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
        deliveryType: json["deliveryType"] == null ? null : List<dynamic>.from(json["deliveryType"].map((x) => x)),
        orderDetail: json["orderDetail"] == null ? null : List<OrderDetail>.from(json["orderDetail"].map((x) => OrderDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId == null ? null : orderId,
        "tenantId": tenantId == null ? null : tenantId,
        "providerId": providerId == null ? null : providerId,
        "consumerId": consumerId == null ? null : consumerId,
        "addressId": addressId == null ? null : addressId,
        "profileName": profileName == null ? null : profileName,
        "profileSlug": profileSlug == null ? null : profileSlug,
        "orderStatus": orderStatus == null ? null : orderStatus,
        "orderType": orderType == null ? null : orderType,
        "bookingDate": bookingDate == null ? null : bookingDate!.toIso8601String(),
        "couponId": couponId,
        "couponCode": couponCode,
        "prefferedCurrency": prefferedCurrency == null ? null : prefferedCurrency,
        "sgstCost": sgstCost == null ? null : sgstCost,
        "sgstPercent": sgstPercent == null ? null : sgstPercent,
        "cgstCost": cgstCost == null ? null : cgstCost,
        "cgstPercent": cgstPercent == null ? null : cgstPercent,
        "taxTotalCost": taxTotalCost == null ? null : taxTotalCost,
        "productTotalCost": productTotalCost == null ? null : productTotalCost,
        "couponCost": couponCost == null ? null : couponCost,
        "totalCost": totalCost == null ? null : totalCost,
        "orderAddress": orderAddress == null ? null : orderAddress,
        "invoiceAddress": invoiceAddress == null ? null : invoiceAddress,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "orderPlacedTime": orderPlacedTime == null ? null : orderPlacedTime!.toIso8601String(),
        "acceptedTime": acceptedTime,
        "rejectedTime": rejectedTime,
        "readyForDeliverTime": readyForDeliverTime,
        "deliveredTime": deliveredTime,
        "cancelledTime": cancelledTime,
        "cancelledByDeliveryAgentDateTime": cancelledByDeliveryAgentDateTime,
        "commissionCost": commissionCost == null ? null : commissionCost,
        "payToProviderId": payToProviderId,
        "additionalNote": additionalNote == null ? null : additionalNote,
        "reviewStatus": reviewStatus == null ? null : reviewStatus,
        "cancelOrderStatus": cancelOrderStatus == null ? null : cancelOrderStatus,
        "orderRejectReason": orderRejectReason,
        "oneTimePassword": oneTimePassword,
        "otpExpiryDateTime": otpExpiryDateTime,
        "deliveryMode": deliveryMode == null ? null : deliveryMode,
        "deliveryRate": deliveryRate == null ? null : deliveryRate,
        "paymentCapturedDateTime": paymentCapturedDateTime == null ? null : paymentCapturedDateTime!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
        "deliveryType": deliveryType == null ? null : List<dynamic>.from(deliveryType!.map((x) => x)),
        "orderDetail": orderDetail == null ? null : List<dynamic>.from(orderDetail!.map((x) => x.toJson())),
    };
}

class OrderDetail {
    OrderDetail({
        this.orderdetailId,
        this.cartDetailsId,
        this.cartId,
        this.invId,
        this.scheduleId,
        this.orderId,
        this.scheduleDetailsId,
        this.productId,
        this.quantity,
        this.productName,
        this.productDescription,
        this.productSlug,
        this.productTiming,
        this.currency,
        this.status,
        this.cost,
        this.tax,
        this.total,
        this.couponDiscount,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? orderdetailId;
    String? cartDetailsId;
    String? cartId;
    int? invId;
    int? scheduleId;
    int? orderId;
    int? scheduleDetailsId;
    int? productId;
    int? quantity;
    String? productName;
    String? productDescription;
    String? productSlug;
    String? productTiming;
    String? currency;
    bool? status;
    String? cost;
    String? tax;
    String? total;
    String? couponDiscount;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    dynamic updatedBy;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderdetailId: json["orderdetailId"] == null ? null : json["orderdetailId"],
        cartDetailsId: json["cartDetailsId"] == null ? null : json["cartDetailsId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        invId: json["invId"] == null ? null : json["invId"],
        scheduleId: json["scheduleId"] == null ? null : json["scheduleId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        scheduleDetailsId: json["scheduleDetailsId"] == null ? null : json["scheduleDetailsId"],
        productId: json["productId"] == null ? null : json["productId"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        productName: json["productName"] == null ? null : json["productName"],
        productDescription: json["productDescription"] == null ? null : json["productDescription"],
        productSlug: json["productSlug"] == null ? null : json["productSlug"],
        productTiming: json["productTiming"] == null ? null : json["productTiming"],
        currency: json["currency"] == null ? null : json["currency"],
        status: json["status"] == null ? null : json["status"],
        cost: json["cost"] == null ? null : json["cost"],
        tax: json["tax"] == null ? null : json["tax"],
        total: json["total"] == null ? null : json["total"],
        couponDiscount: json["couponDiscount"] == null ? null : json["couponDiscount"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "orderdetailId": orderdetailId == null ? null : orderdetailId,
        "cartDetailsId": cartDetailsId == null ? null : cartDetailsId,
        "cartId": cartId == null ? null : cartId,
        "invId": invId == null ? null : invId,
        "scheduleId": scheduleId == null ? null : scheduleId,
        "orderId": orderId == null ? null : orderId,
        "scheduleDetailsId": scheduleDetailsId == null ? null : scheduleDetailsId,
        "productId": productId == null ? null : productId,
        "quantity": quantity == null ? null : quantity,
        "productName": productName == null ? null : productName,
        "productDescription": productDescription == null ? null : productDescription,
        "productSlug": productSlug == null ? null : productSlug,
        "productTiming": productTiming == null ? null : productTiming,
        "currency": currency == null ? null : currency,
        "status": status == null ? null : status,
        "cost": cost == null ? null : cost,
        "tax": tax == null ? null : tax,
        "total": total == null ? null : total,
        "couponDiscount": couponDiscount == null ? null : couponDiscount,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy,
    };
}
