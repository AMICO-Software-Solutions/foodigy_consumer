// To parse this JSON data, do
//
//     final pastOrderModel = pastOrderModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

PastOrderModel pastOrderModelFromJson(String str) => PastOrderModel.fromJson(json.decode(str));

String pastOrderModelToJson(PastOrderModel data) => json.encode(data.toJson());

class PastOrderModel {
    PastOrderModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory PastOrderModel.fromJson(Map<String, dynamic> json) => PastOrderModel(
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
        this.razorpayPayment,
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
    OrderType? orderType;
    DateTime? bookingDate;
    int? couponId;
    String? couponCode;
    Currency? prefferedCurrency;
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
    DateTime? acceptedTime;
    DateTime? rejectedTime;
    DateTime? readyForDeliverTime;
    DateTime? deliveredTime;
    DateTime? cancelledTime;
    dynamic cancelledByDeliveryAgentDateTime;
    String? commissionCost;
    int? payToProviderId;
    String? additionalNote;
    bool? reviewStatus;
    bool? cancelOrderStatus;
    String? orderRejectReason;
    int? oneTimePassword;
    DateTime? otpExpiryDateTime;
    DeliveryMode? deliveryMode;
    String? deliveryRate;
    DateTime? paymentCapturedDateTime;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;
    List<DeliveryType>? deliveryType;
    List<RazorpayPayment>? razorpayPayment;
    List<OrderDetail>? orderDetail;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["orderId"],
        tenantId: json["tenantId"],
        providerId: json["providerId"],
        consumerId: json["consumerId"],
        addressId: json["addressId"],
        profileName: json["profileName"],
        profileSlug: json["profileSlug"],
        orderStatus: json["orderStatus"],
        orderType: orderTypeValues.map[json["orderType"]],
        bookingDate: DateTime.parse(json["bookingDate"]),
        couponId:  json["couponId"],
        couponCode:  json["couponCode"],
        prefferedCurrency: currencyValues.map[json["prefferedCurrency"]],
        sgstCost: json["sgstCost"],
        sgstPercent: json["sgstPercent"],
        cgstCost: json["cgstCost"],
        cgstPercent: json["cgstPercent"],
        taxTotalCost: json["taxTotalCost"],
        productTotalCost: json["productTotalCost"],
        couponCost:  json["couponCost"],
        totalCost: json["totalCost"],
        orderAddress: json["orderAddress"],
        invoiceAddress: json["invoiceAddress"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        orderPlacedTime: DateTime.parse(json["orderPlacedTime"]),
        acceptedTime: json["acceptedTime"] == null ? null : DateTime.parse(json["acceptedTime"]),
        rejectedTime: json["rejectedTime"] == null ? null : DateTime.parse(json["rejectedTime"]),
        readyForDeliverTime: json["readyForDeliverTime"] == null ? null : DateTime.parse(json["readyForDeliverTime"]),
        deliveredTime: json["deliveredTime"] == null ? null : DateTime.parse(json["deliveredTime"]),
        cancelledTime: json["cancelledTime"] == null ? null : DateTime.parse(json["cancelledTime"]),
        cancelledByDeliveryAgentDateTime: json["cancelledByDeliveryAgentDateTime"],
        commissionCost: json["commissionCost"],
        payToProviderId:  json["payToProviderId"],
        additionalNote: json["additionalNote"],
        reviewStatus: json["reviewStatus"],
        cancelOrderStatus: json["cancelOrderStatus"],
        orderRejectReason:  json["orderRejectReason"],
        oneTimePassword:  json["oneTimePassword"],
        otpExpiryDateTime: json["otpExpiryDateTime"] == null ? null : DateTime.parse(json["otpExpiryDateTime"]),
        deliveryMode: deliveryModeValues.map[json["deliveryMode"]],
        deliveryRate: json["deliveryRate"],
        paymentCapturedDateTime: json["paymentCapturedDateTime"] == null ? null : DateTime.parse(json["paymentCapturedDateTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy:  json["updatedBy"],
        deliveryType: List<DeliveryType>.from(json["deliveryType"].map((x) => DeliveryType.fromJson(x))),
        razorpayPayment: List<RazorpayPayment>.from(json["RazorpayPayment"].map((x) => RazorpayPayment.fromJson(x))),
        orderDetail: List<OrderDetail>.from(json["orderDetail"].map((x) => OrderDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "tenantId": tenantId,
        "providerId": providerId,
        "consumerId": consumerId,
        "addressId": addressId,
        "profileName": profileNameValues.reverse[profileName],
        "profileSlug": profileSlug,
        "orderStatus": orderStatusValues.reverse[orderStatus],
        "orderType": orderTypeValues.reverse[orderType],
        "bookingDate": bookingDate!.toIso8601String(),
        "couponId":  couponId,
        "couponCode":  couponCode,
        "prefferedCurrency": currencyValues.reverse[prefferedCurrency],
        "sgstCost": sgstCost,
        "sgstPercent": sgstPercent,
        "cgstCost": cgstCost,
        "cgstPercent": cgstPercent,
        "taxTotalCost": taxTotalCost,
        "productTotalCost": productTotalCost,
        "couponCost":  couponCost,
        "totalCost": totalCost,
        "orderAddress": orderAddress,
        "invoiceAddress": invoiceAddress,
        "phoneNumber": phoneNumber,
        "email": emailValues.reverse[email],
        "orderPlacedTime": orderPlacedTime!.toIso8601String(),
        "acceptedTime": acceptedTime == null ? null : acceptedTime!.toIso8601String(),
        "rejectedTime": rejectedTime == null ? null : rejectedTime!.toIso8601String(),
        "readyForDeliverTime": readyForDeliverTime == null ? null : readyForDeliverTime!.toIso8601String(),
        "deliveredTime": deliveredTime == null ? null : deliveredTime!.toIso8601String(),
        "cancelledTime": cancelledTime == null ? null : cancelledTime!.toIso8601String(),
        "cancelledByDeliveryAgentDateTime": cancelledByDeliveryAgentDateTime,
        "commissionCost": commissionCost,
        "payToProviderId":payToProviderId,
        "additionalNote": additionalNote,
        "reviewStatus": reviewStatus,
        "cancelOrderStatus": cancelOrderStatus,
        "orderRejectReason":  orderRejectReason,
        "oneTimePassword":  oneTimePassword,
        "otpExpiryDateTime": otpExpiryDateTime == null ? null : otpExpiryDateTime!.toIso8601String(),
        "deliveryMode": deliveryModeValues.reverse[deliveryMode],
        "deliveryRate": deliveryRate,
        "paymentCapturedDateTime": paymentCapturedDateTime == null ? null : paymentCapturedDateTime!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "deliveryType": List<dynamic>.from(deliveryType!.map((x) => x.toJson())),
        "RazorpayPayment": List<dynamic>.from(razorpayPayment!.map((x) => x.toJson())),
        "orderDetail": List<dynamic>.from(orderDetail!.map((x) => x.toJson())),
    };
}

enum DeliveryMode { TAKEAWAY, PICKDROP, DUNZO }

final deliveryModeValues = EnumValues({
    "DUNZO": DeliveryMode.DUNZO,
    "PICKDROP": DeliveryMode.PICKDROP,
    "TAKEAWAY": DeliveryMode.TAKEAWAY
});

class DeliveryType {
    DeliveryType({
        this.deliveryTypeId,
        this.orderId,
        this.trackingId,
        this.traceId,
        this.deliveryStatus,
        this.deliveryStatusTimeStamp,
        this.deliveryPersonName,
        this.deliveryPersonContactNumber,
        this.cancelledBy,
        this.remarks,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? deliveryTypeId;
    int? orderId;
    String? trackingId;
    String? traceId;
    String? deliveryStatus;
    DateTime? deliveryStatusTimeStamp;
    String? deliveryPersonName;
    String? deliveryPersonContactNumber;
    String? cancelledBy;
    dynamic remarks;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;

    factory DeliveryType.fromJson(Map<String, dynamic> json) => DeliveryType(
        deliveryTypeId: json["deliveryTypeId"],
        orderId: json["orderId"],
        trackingId:  json["trackingId"],
        traceId:  json["traceId"],
        deliveryStatus:  json["deliveryStatus"],
        deliveryStatusTimeStamp: json["deliveryStatusTimeStamp"] == null ? null : DateTime.parse(json["deliveryStatusTimeStamp"]),
        deliveryPersonName:  json["deliveryPersonName"],
        deliveryPersonContactNumber:  json["deliveryPersonContactNumber"],
        cancelledBy: json["cancelledBy"],
        remarks: json["remarks"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy:  json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "deliveryTypeId": deliveryTypeId,
        "orderId": orderId,
        "trackingId":  trackingId,
        "traceId":  traceId,
        "deliveryStatus": deliveryStatus,
        "deliveryStatusTimeStamp": deliveryStatusTimeStamp == null ? null : deliveryStatusTimeStamp!.toIso8601String(),
        "deliveryPersonName":  deliveryPersonName,
        "deliveryPersonContactNumber": deliveryPersonContactNumber,
        "cancelledBy": cancelledBy,
        "remarks": remarks,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy":updatedBy,
    };
}

enum Email { XINODO7304_WNPOP_COM, XIKEYAF721_SYSWIFT_COM, JSMINE97_GMAIL_COM, TECAFIJ557_ISHYP_COM }

final emailValues = EnumValues({
    "jsmine97@gmail.com": Email.JSMINE97_GMAIL_COM,
    "tecafij557@ishyp.com": Email.TECAFIJ557_ISHYP_COM,
    "xikeyaf721@syswift.com": Email.XIKEYAF721_SYSWIFT_COM,
    "xinodo7304@wnpop.com": Email.XINODO7304_WNPOP_COM
});

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
        this.customization,
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
    ProductTiming? productTiming;
    Currency? currency;
    bool? status;
    String? cost;
    String? tax;
    String? total;
    String? couponDiscount;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    dynamic updatedBy;
    OrderDetailCustomization? customization;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderdetailId: json["orderdetailId"],
        cartDetailsId: json["cartDetailsId"],
        cartId: json["cartId"],
        invId: json["invId"],
        scheduleId: json["scheduleId"],
        orderId: json["orderId"],
        scheduleDetailsId: json["scheduleDetailsId"],
        productId: json["productId"],
        quantity: json["quantity"],
        productName:json["productName"],
        productDescription: json["productDescription"],
        productSlug: json["productSlug"],
        productTiming: productTimingValues.map[json["productTiming"]],
        currency: currencyValues.map[json["currency"]],
        status: json["status"],
        cost: json["cost"],
        tax: json["tax"],
        total: json["total"],
        couponDiscount: json["couponDiscount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        customization: json["customization"] == null ? null : OrderDetailCustomization.fromJson(json["customization"]),
    );

    Map<String, dynamic> toJson() => {
        "orderdetailId": orderdetailId,
        "cartDetailsId": cartDetailsId,
        "cartId": cartId,
        "invId": invId,
        "scheduleId": scheduleId,
        "orderId": orderId,
        "scheduleDetailsId": scheduleDetailsId,
        "productId": productId,
        "quantity": quantity,
        "productName": productName,
        "productDescription": productDescription,
        "productSlug": productSlug,
        "productTiming": productTimingValues.reverse[productTiming],
        "currency": currencyValues.reverse[currency],
        "status": status,
        "cost": cost,
        "tax": tax,
        "total": total,
        "couponDiscount": couponDiscount,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "customization": customization == null ? null : customization!.toJson(),
    };
}

enum Currency { INR }

final currencyValues = EnumValues({
    "INR": Currency.INR
});

class OrderDetailCustomization {
    OrderDetailCustomization({
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
    int? orderdetailId;
    CustomizationCustomization? customization;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? createdBy;
    dynamic updatedBy;

    factory OrderDetailCustomization.fromJson(Map<String, dynamic> json) => OrderDetailCustomization(
        customizationId: json["customizationId"],
        cartDetailsId: json["cartDetailsId"],
        orderdetailId: json["orderdetailId"],
        customization: CustomizationCustomization.fromJson(json["customization"]),
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "customizationId": customizationId,
        "cartDetailsId": cartDetailsId,
        "orderdetailId": orderdetailId,
        "customization": customization!.toJson(),
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}

class CustomizationCustomization {
    CustomizationCustomization({
        this.custom,
    });

    List<dynamic>? custom;

    factory CustomizationCustomization.fromJson(Map<String, dynamic> json) => CustomizationCustomization(
        custom: json["custom"] == null ? null : List<dynamic>.from(json["custom"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "custom": custom == null ? null : List<dynamic>.from(custom!.map((x) => x)),
    };
}

class CustomClass {
    CustomClass({
        this.id,
        this.name,
        this.selectedCustomization,
    });

    int? id;
    String? name;
    bool? selectedCustomization;

    factory CustomClass.fromJson(Map<String, dynamic> json) => CustomClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        selectedCustomization: json["selected_customization"] == null ? null : json["selected_customization"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "selected_customization": selectedCustomization == null ? null : selectedCustomization,
    };
}

enum ProductName { RAGI_DOSA, PONGAL, STRING, RAGI_IDLY, DOSA, PASTA, CHOCOLATE_DOSA, MEALS }

final productNameValues = EnumValues({
    "Chocolate Dosa": ProductName.CHOCOLATE_DOSA,
    "Dosa": ProductName.DOSA,
    "Meals": ProductName.MEALS,
    "Pasta": ProductName.PASTA,
    "Pongal": ProductName.PONGAL,
    "Ragi Dosa": ProductName.RAGI_DOSA,
    "Ragi Idly": ProductName.RAGI_IDLY,
    "String": ProductName.STRING
});

enum ProductTiming { BRUNCH_BREAKFAST, DINNER, BREAKFAST, BREAKFAST_DINNER, BRUNCH, SNACK }

final productTimingValues = EnumValues({
    "BREAKFAST": ProductTiming.BREAKFAST,
    "BREAKFAST,DINNER": ProductTiming.BREAKFAST_DINNER,
    "BRUNCH": ProductTiming.BRUNCH,
    "BRUNCH,BREAKFAST": ProductTiming.BRUNCH_BREAKFAST,
    "DINNER": ProductTiming.DINNER,
    "SNACK": ProductTiming.SNACK
});

enum OrderStatus { SYSTEMREJECTED, CANCELLEDBYDELIVERYAGENT, REJECTED, CANCELLED, COMPLETED }

final orderStatusValues = EnumValues({
    "CANCELLED": OrderStatus.CANCELLED,
    "CANCELLEDBYDELIVERYAGENT": OrderStatus.CANCELLEDBYDELIVERYAGENT,
    "COMPLETED": OrderStatus.COMPLETED,
    "REJECTED": OrderStatus.REJECTED,
    "SYSTEMREJECTED": OrderStatus.SYSTEMREJECTED
});

enum OrderType { SCHEDULED }

final orderTypeValues = EnumValues({
    "SCHEDULED": OrderType.SCHEDULED
});

enum ProfileName { HOME_MADE_FOOD, BEST_HOME_CHEF, BIDIHI, NEWCHEF_100 }

final profileNameValues = EnumValues({
    "BestHome Chef": ProfileName.BEST_HOME_CHEF,
    "bidihi": ProfileName.BIDIHI,
    "HomeMade Food": ProfileName.HOME_MADE_FOOD,
    "newchef 100": ProfileName.NEWCHEF_100
});

class RazorpayPayment {
    RazorpayPayment({
        this.id,
        this.tenantId,
        this.orderId,
        this.razorpayEventId,
        this.razorpayOrderId,
        this.razorpayPaymentId,
        this.amount,
        this.currency,
        this.paymentStatus,
        this.paymentMode,
        this.international,
        this.amountRefunded,
        this.refundStatus,
        this.capture,
        this.cardId,
        this.card,
        this.bank,
        this.wallet,
        this.vpa,
        this.email,
        this.contact,
        this.fee,
        this.tax,
        this.errorCode,
        this.errorDescription,
        this.errorSource,
        this.errorStep,
        this.errorReason,
        this.acquirerData,
        this.razorpayCreatedAt,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.razorpayRefund,
    });

    int? id;
    int? tenantId;
    int? orderId;
    String? razorpayEventId;
    String? razorpayOrderId;
    String? razorpayPaymentId;
    String? amount;
    Currency? currency;
    String? paymentStatus;
    PaymentMode? paymentMode;
    bool? international;
    String? amountRefunded;
    RazorpayPaymentRefundStatus? refundStatus;
    bool? capture;
    String? cardId;
    Card? card;
    Bank? bank;
    String? wallet;
    String? vpa;
    Email? email;
    String? contact;
    String? fee;
    String? tax;
    ErrorCode? errorCode;
    String? errorDescription;
    ErrorSource? errorSource;
    ErrorStep? errorStep;
    ErrorReason? errorReason;
    AcquirerData? acquirerData;
    DateTime? razorpayCreatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;
    List<RazorpayRefund>? razorpayRefund;

    factory RazorpayPayment.fromJson(Map<String, dynamic> json) => RazorpayPayment(
        id: json["id"],
        tenantId: json["tenantId"],
        orderId: json["orderId"],
        razorpayEventId: json["razorpayEventId"],
        razorpayOrderId: json["razorpayOrderId"],
        razorpayPaymentId: json["razorpayPaymentId"],
        amount: json["amount"],
        currency: currencyValues.map[json["currency"]],
        paymentStatus: json["paymentStatus"],
        paymentMode: paymentModeValues.map[json["paymentMode"]],
        international:  json["international"],
        amountRefunded: json["amountRefunded"],
        refundStatus: json["refundStatus"] == null ? null : razorpayPaymentRefundStatusValues.map[json["refundStatus"]],
        capture: json["capture"],
        cardId:  json["cardId"],
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
        bank: json["bank"] == null ? null : bankValues.map[json["bank"]],
        wallet:  json["wallet"],
        vpa:json["vpa"],
        email: emailValues.map[json["email"]],
        contact: json["contact"],
        fee: json["fee"],
        tax: json["tax"],
        errorCode: json["errorCode"] == null ? null : errorCodeValues.map[json["errorCode"]],
        errorDescription:  json["errorDescription"],
        errorSource: json["errorSource"] == null ? null : errorSourceValues.map[json["errorSource"]],
        errorStep: json["errorStep"] == null ? null : errorStepValues.map[json["errorStep"]],
        errorReason: json["errorReason"] == null ? null : errorReasonValues.map[json["errorReason"]],
        acquirerData: AcquirerData.fromJson(json["acquirerData"]),
        razorpayCreatedAt: DateTime.parse(json["razorpayCreatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        razorpayRefund: List<RazorpayRefund>.from(json["RazorpayRefund"].map((x) => RazorpayRefund.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tenantId": tenantId,
        "orderId": orderId,
        "razorpayEventId": razorpayEventId,
        "razorpayOrderId": razorpayOrderId,
        "razorpayPaymentId": razorpayPaymentId,
        "amount": amount,
        "currency": currencyValues.reverse[currency],
        "paymentStatus":paymentStatus,
        "paymentMode": paymentModeValues.reverse[paymentMode],
        "international":  international,
        "amountRefunded": amountRefunded,
        "refundStatus": refundStatus == null ? null : razorpayPaymentRefundStatusValues.reverse[refundStatus],
        "capture": capture,
        "cardId": cardId,
        "card": card == null ? null : card!.toJson(),
        "bank": bank == null ? null : bankValues.reverse[bank],
        "wallet": wallet,
        "vpa": vpa == null ? null : vpa,
        "email": emailValues.reverse[email],
        "contact": contact,
        "fee": fee,
        "tax": tax,
        "errorCode": errorCode == null ? null : errorCodeValues.reverse[errorCode],
        "errorDescription":  errorDescription,
        "errorSource": errorSource == null ? null : errorSourceValues.reverse[errorSource],
        "errorStep": errorStep == null ? null : errorStepValues.reverse[errorStep],
        "errorReason": errorReason == null ? null : errorReasonValues.reverse[errorReason],
        "acquirerData": acquirerData!.toJson(),
        "razorpayCreatedAt": razorpayCreatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "RazorpayRefund": List<dynamic>.from(razorpayRefund!.map((x) => x.toJson())),
    };
}

class AcquirerData {
    AcquirerData({
        this.bankTransactionId,
        this.authCode,
        this.transactionId,
        this.rrn,
        this.upiTransactionId,
    });

    String? bankTransactionId;
    String? authCode;
    dynamic transactionId;
    String? rrn;
    String? upiTransactionId;

    factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        bankTransactionId:  json["bank_transaction_id"],
        authCode:  json["auth_code"],
        transactionId: json["transaction_id"],
        rrn: json["rrn"],
        upiTransactionId:  json["upi_transaction_id"],
    );

    Map<String, dynamic> toJson() => {
        "bank_transaction_id":  bankTransactionId,
        "auth_code":  authCode,
        "transaction_id": transactionId,
        "rrn":  rrn,
        "upi_transaction_id":  upiTransactionId,
    };
}

enum Bank { IBKL, UTIB, BARB_R, YESB, ICIC, KKBK }

final bankValues = EnumValues({
    "BARB_R": Bank.BARB_R,
    "IBKL": Bank.IBKL,
    "ICIC": Bank.ICIC,
    "KKBK": Bank.KKBK,
    "UTIB": Bank.UTIB,
    "YESB": Bank.YESB
});

class Card {
    Card({
        this.id,
        this.emi,
        this.name,
        this.type,
        this.last4,
        this.entity,
        this.issuer,
        this.network,
        this.subType,
        this.tokenIin,
        this.international,
        this.iin,
    });

    String? id;
    bool? emi;
    String? name;
    String? type;
    String? last4;
    PaymentMode? entity;
    String? issuer;
    String? network;
    String? subType;
    dynamic tokenIin;
    bool? international;
    String? iin;

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        emi: json["emi"],
        name: json["name"],
        type: json["type"],
        last4: json["last4"],
        entity: paymentModeValues.map[json["entity"]],
        issuer: json["issuer"],
        network: json["network"],
        subType: json["sub_type"],
        tokenIin: json["token_iin"],
        international: json["international"],
        iin:  json["iin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "emi": emi,
        "name": name,
        "type": type,
        "last4": last4,
        "entity": paymentModeValues.reverse[entity],
        "issuer": issuer,
        "network": network,
        "sub_type": subType,
        "token_iin": tokenIin,
        "international": international,
        "iin": iin,
    };
}

enum PaymentMode { NETBANKING, CARD, CARDLESS_EMI, UPI, WALLET }

final paymentModeValues = EnumValues({
    "card": PaymentMode.CARD,
    "cardless_emi": PaymentMode.CARDLESS_EMI,
    "netbanking": PaymentMode.NETBANKING,
    "upi": PaymentMode.UPI,
    "wallet": PaymentMode.WALLET
});

enum ErrorCode { BAD_REQUEST_ERROR }

final errorCodeValues = EnumValues({
    "BAD_REQUEST_ERROR": ErrorCode.BAD_REQUEST_ERROR
});

enum ErrorReason { PAYMENT_CANCELLED, PAYMENT_FAILED, PAYMENT_TIMED_OUT }

final errorReasonValues = EnumValues({
    "payment_cancelled": ErrorReason.PAYMENT_CANCELLED,
    "payment_failed": ErrorReason.PAYMENT_FAILED,
    "payment_timed_out": ErrorReason.PAYMENT_TIMED_OUT
});

enum ErrorSource { CUSTOMER, BANK }

final errorSourceValues = EnumValues({
    "bank": ErrorSource.BANK,
    "customer": ErrorSource.CUSTOMER
});

enum ErrorStep { PAYMENT_AUTHENTICATION, PAYMENT_AUTHORIZATION }

final errorStepValues = EnumValues({
    "payment_authentication": ErrorStep.PAYMENT_AUTHENTICATION,
    "payment_authorization": ErrorStep.PAYMENT_AUTHORIZATION
});

enum PaymentStatus { REFUNDED, AUTHORIZED, CAPTURED, FAILED }

final paymentStatusValues = EnumValues({
    "authorized": PaymentStatus.AUTHORIZED,
    "captured": PaymentStatus.CAPTURED,
    "failed": PaymentStatus.FAILED,
    "refunded": PaymentStatus.REFUNDED
});

class RazorpayRefund {
    RazorpayRefund({
        this.id,
        this.orderId,
        this.tenantId,
        this.razorpayEventId,
        this.razorpayRefundId,
        this.razorpayPaymentId,
        this.currency,
        this.receipt,
        this.refundStatus,
        this.refundAmount,
        this.batchId,
        this.speedProcessed,
        this.speedRequested,
        this.razorpayCreatedAt,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    int? id;
    int? orderId;
    int? tenantId;
    String? razorpayEventId;
    String? razorpayRefundId;
    String? razorpayPaymentId;
    Currency? currency;
    String? receipt;
    String? refundStatus;
    String? refundAmount;
    dynamic batchId;
    Speed? speedProcessed;
    Speed? speedRequested;
    DateTime? razorpayCreatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    AtedBy? createdBy;
    AtedBy? updatedBy;

    factory RazorpayRefund.fromJson(Map<String, dynamic> json) => RazorpayRefund(
        id: json["id"],
        orderId: json["orderId"],
        tenantId: json["tenantId"],
        razorpayEventId: json["razorpayEventId"],
        razorpayRefundId: json["razorpayRefundId"],
        razorpayPaymentId: json["razorpayPaymentId"],
        currency: currencyValues.map[json["currency"]],
        receipt: json["receipt"],
        refundStatus: json["refundStatus"],
        refundAmount: json["refundAmount"],
        batchId: json["batchId"],
        speedProcessed: speedValues.map[json["speedProcessed"]],
        speedRequested: speedValues.map[json["speedRequested"]],
        razorpayCreatedAt: DateTime.parse(json["razorpayCreatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: atedByValues.map[json["createdBy"]],
        updatedBy: atedByValues.map[json["updatedBy"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "tenantId": tenantId,
        "razorpayEventId": razorpayEventId,
        "razorpayRefundId": razorpayRefundId,
        "razorpayPaymentId": razorpayPaymentId,
        "currency": currencyValues.reverse[currency],
        "receipt": receipt,
        "refundStatus": refundStatus,
        "refundAmount": refundAmount,
        "batchId": batchId,
        "speedProcessed": speedValues.reverse[speedProcessed],
        "speedRequested": speedValues.reverse[speedRequested],
        "razorpayCreatedAt": razorpayCreatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": atedByValues.reverse[createdBy],
        "updatedBy": atedByValues.reverse[updatedBy],
    };
}

enum AtedBy { RAZORPAY }

final atedByValues = EnumValues({
    "Razorpay": AtedBy.RAZORPAY
});

enum RazorpayRefundRefundStatus { PROCESSED }

final razorpayRefundRefundStatusValues = EnumValues({
    "processed": RazorpayRefundRefundStatus.PROCESSED
});

enum Speed { NORMAL }

final speedValues = EnumValues({
    "normal": Speed.NORMAL
});

enum RazorpayPaymentRefundStatus { FULL }

final razorpayPaymentRefundStatusValues = EnumValues({
    "full": RazorpayPaymentRefundStatus.FULL
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) =>MapEntry(v, k));
        return reverseMap!;
    }
}
