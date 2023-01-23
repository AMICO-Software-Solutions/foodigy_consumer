// To parse this JSON data, do
//
//     final chefOrderModel = chefOrderModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ChefOrderModel chefOrderModelFromJson(String str) => ChefOrderModel.fromJson(json.decode(str));

String chefOrderModelToJson(ChefOrderModel data) => json.encode(data.toJson());

class ChefOrderModel {
    ChefOrderModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    List<Datum>? data;

    factory ChefOrderModel.fromJson(Map<String, dynamic> json) => ChefOrderModel(
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
    String? orderType;
    DateTime? bookingDate;
    int? couponId;
    String? couponCode;
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
    String? deliveryMode;
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
        couponId: json["couponId"] == null ? null : json["couponId"],
        couponCode: json["couponCode"] == null ? null : json["couponCode"],
        prefferedCurrency: json["prefferedCurrency"] == null ? null :json["prefferedCurrency"],
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
        acceptedTime: json["acceptedTime"] == null ? null : DateTime.parse(json["acceptedTime"]),
        rejectedTime: json["rejectedTime"] == null ? null : DateTime.parse(json["rejectedTime"]),
        readyForDeliverTime: json["readyForDeliverTime"] == null ? null : DateTime.parse(json["readyForDeliverTime"]),
        deliveredTime: json["deliveredTime"] == null ? null : DateTime.parse(json["deliveredTime"]),
        cancelledTime: json["cancelledTime"] == null ? null : DateTime.parse(json["cancelledTime"]),
        cancelledByDeliveryAgentDateTime: json["cancelledByDeliveryAgentDateTime"],
        commissionCost: json["commissionCost"] == null ? null : json["commissionCost"],
        payToProviderId: json["payToProviderId"] == null ? null : json["payToProviderId"],
        additionalNote: json["additionalNote"] == null ? null :json["additionalNote"],
        reviewStatus: json["reviewStatus"] == null ? null : json["reviewStatus"],
        cancelOrderStatus: json["cancelOrderStatus"] == null ? null : json["cancelOrderStatus"],
        orderRejectReason: json["orderRejectReason"] == null ? null : json["orderRejectReason"],
        oneTimePassword: json["oneTimePassword"] == null ? null : json["oneTimePassword"],
        otpExpiryDateTime: json["otpExpiryDateTime"] == null ? null : DateTime.parse(json["otpExpiryDateTime"]),
        deliveryMode: json["deliveryMode"] == null ? null :json["deliveryMode"],
        deliveryRate: json["deliveryRate"] == null ? null : json["deliveryRate"],
        paymentCapturedDateTime: json["paymentCapturedDateTime"] == null ? null : DateTime.parse(json["paymentCapturedDateTime"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
        deliveryType: json["deliveryType"] == null ? null : List<DeliveryType>.from(json["deliveryType"].map((x) => DeliveryType.fromJson(x))),
        razorpayPayment: json["RazorpayPayment"] == null ? null : List<RazorpayPayment>.from(json["RazorpayPayment"].map((x) => RazorpayPayment.fromJson(x))),
        orderDetail: json["orderDetail"] == null ? null : List<OrderDetail>.from(json["orderDetail"].map((x) => OrderDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId == null ? null : orderId,
        "tenantId": tenantId == null ? null : tenantId,
        "providerId": providerId == null ? null : providerId,
        "consumerId": consumerId == null ? null : consumerId,
        "addressId": addressId == null ? null : addressId,
        "profileName": profileName == null ? null :profileName,
        "profileSlug": profileSlug == null ? null : profileSlug,
        "orderStatus": orderStatus == null ? null : orderStatus,
        "orderType": orderType == null ? null :orderType,
        "bookingDate": bookingDate == null ? null : bookingDate!.toIso8601String(),
        "couponId": couponId == null ? null : couponId,
        "couponCode": couponCode == null ? null : couponCode,
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
        "acceptedTime": acceptedTime == null ? null : acceptedTime!.toIso8601String(),
        "rejectedTime": rejectedTime == null ? null : rejectedTime!.toIso8601String(),
        "readyForDeliverTime": readyForDeliverTime == null ? null : readyForDeliverTime!.toIso8601String(),
        "deliveredTime": deliveredTime == null ? null : deliveredTime!.toIso8601String(),
        "cancelledTime": cancelledTime == null ? null : cancelledTime!.toIso8601String(),
        "cancelledByDeliveryAgentDateTime": cancelledByDeliveryAgentDateTime,
        "commissionCost": commissionCost == null ? null : commissionCost,
        "payToProviderId": payToProviderId == null ? null : payToProviderId,
        "additionalNote": additionalNote == null ? null : additionalNote,
        "reviewStatus": reviewStatus == null ? null : reviewStatus,
        "cancelOrderStatus": cancelOrderStatus == null ? null : cancelOrderStatus,
        "orderRejectReason": orderRejectReason == null ? null : orderRejectReason,
        "oneTimePassword": oneTimePassword == null ? null : oneTimePassword,
        "otpExpiryDateTime": otpExpiryDateTime == null ? null : otpExpiryDateTime!.toIso8601String(),
        "deliveryMode": deliveryMode == null ? null : deliveryMode,
        "deliveryRate": deliveryRate == null ? null : deliveryRate,
        "paymentCapturedDateTime": paymentCapturedDateTime == null ? null : paymentCapturedDateTime!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy == null ? null : updatedBy,
        "deliveryType": deliveryType == null ? null : List<dynamic>.from(deliveryType!.map((x) => x.toJson())),
        "RazorpayPayment": razorpayPayment == null ? null : List<dynamic>.from(razorpayPayment!.map((x) => x.toJson())),
        "orderDetail": orderDetail == null ? null : List<dynamic>.from(orderDetail!.map((x) => x.toJson())),
    };
}


class DeliveryType {
    DeliveryType({
        this.deliveryTypeId,
        this.orderId,
        this.trackingId,
        this.traceId,
        this.trackingurl,
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
    dynamic trackingurl;
   String? deliveryStatus;
    DateTime? deliveryStatusTimeStamp;
    dynamic deliveryPersonName;
    dynamic deliveryPersonContactNumber;
    dynamic cancelledBy;
    dynamic remarks;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;

    factory DeliveryType.fromJson(Map<String, dynamic> json) => DeliveryType(
        deliveryTypeId: json["deliveryTypeId"] == null ? null : json["deliveryTypeId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        trackingId: json["trackingId"] == null ? null : json["trackingId"],
        traceId: json["traceId"] == null ? null : json["traceId"],
        trackingurl: json["trackingurl"],
        deliveryStatus: json["deliveryStatus"] == null ? null : json["deliveryStatus"],
        deliveryStatusTimeStamp: json["deliveryStatusTimeStamp"] == null ? null : DateTime.parse(json["deliveryStatusTimeStamp"]),
        deliveryPersonName: json["deliveryPersonName"],
        deliveryPersonContactNumber: json["deliveryPersonContactNumber"],
        cancelledBy: json["cancelledBy"],
        remarks: json["remarks"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "deliveryTypeId": deliveryTypeId == null ? null : deliveryTypeId,
        "orderId": orderId == null ? null : orderId,
        "trackingId": trackingId == null ? null : trackingId,
        "traceId": traceId == null ? null : traceId,
        "trackingurl": trackingurl,
        "deliveryStatus": deliveryStatus == null ? null : deliveryStatus,
        "deliveryStatusTimeStamp": deliveryStatusTimeStamp == null ? null : deliveryStatusTimeStamp!.toIso8601String(),
        "deliveryPersonName": deliveryPersonName,
        "deliveryPersonContactNumber": deliveryPersonContactNumber,
        "cancelledBy": cancelledBy,
        "remarks": remarks,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy == null ? null : updatedBy,
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
    OrderDetailCustomization? customization;

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
        customization: json["customization"] == null ? null : OrderDetailCustomization.fromJson(json["customization"]),
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
        "productName": productName == null ? null :productName,
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
        "customization": customization == null ? null : customization!.toJson(),
    };
}


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
        customizationId: json["customizationId"] == null ? null : json["customizationId"],
        cartDetailsId: json["cartDetailsId"] == null ? null : json["cartDetailsId"],
        orderdetailId: json["orderdetailId"] == null ? null : json["orderdetailId"],
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
        "orderdetailId": orderdetailId == null ? null : orderdetailId,
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
        this.settlementId,
        this.settlementStatus,
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
    String? currency;
    String? paymentStatus;
   String? paymentMode;
    bool? international;
    String? amountRefunded;
    RazorpayPaymentRefundStatus? refundStatus;
    bool? capture;
    dynamic cardId;
    dynamic card;
    Bank? bank;
    dynamic wallet;
    Vpa? vpa;
    String? email;
    String? contact;
    String? fee;
    String? tax;
    String? errorCode;
    String? errorDescription;
    String? errorSource;
    String? errorStep;
    String? errorReason;
    AcquirerData? acquirerData;
    SettlementId? settlementId;
    bool? settlementStatus;
    DateTime? razorpayCreatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;
    List<RazorpayRefund>? razorpayRefund;

    factory RazorpayPayment.fromJson(Map<String, dynamic> json) => RazorpayPayment(
        id: json["id"] == null ? null : json["id"],
        tenantId: json["tenantId"] == null ? null : json["tenantId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        razorpayEventId: json["razorpayEventId"] == null ? null : json["razorpayEventId"],
        razorpayOrderId: json["razorpayOrderId"] == null ? null : json["razorpayOrderId"],
        razorpayPaymentId: json["razorpayPaymentId"] == null ? null : json["razorpayPaymentId"],
        amount: json["amount"] == null ? null : json["amount"],
        currency: json["currency"] == null ? null :json["currency"],
        paymentStatus: json["paymentStatus"] == null ? null :json["paymentStatus"],
        paymentMode: json["paymentMode"] == null ? null : json["paymentMode"],
        international: json["international"] == null ? null : json["international"],
        amountRefunded: json["amountRefunded"] == null ? null : json["amountRefunded"],
        refundStatus: json["refundStatus"] == null ? null : razorpayPaymentRefundStatusValues.map[json["refundStatus"]],
        capture: json["capture"] == null ? null : json["capture"],
        cardId: json["cardId"],
        card: json["card"],
        bank: json["bank"] == null ? null : bankValues.map[json["bank"]],
        wallet: json["wallet"],
        vpa: json["vpa"] == null ? null : vpaValues.map[json["vpa"]],
        email: json["email"] == null ? null : json["email"],
        contact: json["contact"] == null ? null : json["contact"],
        fee: json["fee"] == null ? null : json["fee"],
        tax: json["tax"] == null ? null : json["tax"],
        errorCode: json["errorCode"] == null ? null : json["errorCode"],
        errorDescription: json["errorDescription"] == null ? null : json["errorDescription"],
        errorSource: json["errorSource"] == null ? null : json["errorSource"],
        errorStep: json["errorStep"] == null ? null : json["errorStep"],
        errorReason: json["errorReason"] == null ? null : json["errorReason"],
        acquirerData: json["acquirerData"] == null ? null : AcquirerData.fromJson(json["acquirerData"]),
        settlementId: json["settlementId"] == null ? null : settlementIdValues.map[json["settlementId"]],
        settlementStatus: json["settlementStatus"] == null ? null : json["settlementStatus"],
        razorpayCreatedAt: json["razorpayCreatedAt"] == null ? null : DateTime.parse(json["razorpayCreatedAt"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
        razorpayRefund: json["RazorpayRefund"] == null ? null : List<RazorpayRefund>.from(json["RazorpayRefund"].map((x) => RazorpayRefund.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tenantId": tenantId == null ? null : tenantId,
        "orderId": orderId == null ? null : orderId,
        "razorpayEventId": razorpayEventId == null ? null : razorpayEventId,
        "razorpayOrderId": razorpayOrderId == null ? null : razorpayOrderId,
        "razorpayPaymentId": razorpayPaymentId == null ? null : razorpayPaymentId,
        "amount": amount == null ? null : amount,
        "currency": currency == null ? null : currency,
        "paymentStatus": paymentStatus == null ? null : paymentStatus,
        "paymentMode": paymentMode == null ? null :paymentMode,
        "international": international == null ? null : international,
        "amountRefunded": amountRefunded == null ? null : amountRefunded,
        "refundStatus": refundStatus == null ? null : razorpayPaymentRefundStatusValues.reverse[refundStatus],
        "capture": capture == null ? null : capture,
        "cardId": cardId,
        "card": card,
        "bank": bank == null ? null : bankValues.reverse[bank],
        "wallet": wallet,
        "vpa": vpa == null ? null : vpaValues.reverse[vpa],
        "email": email == null ? null : email,
        "contact": contact == null ? null : contact,
        "fee": fee == null ? null : fee,
        "tax": tax == null ? null : tax,
        "errorCode": errorCode == null ? null : errorCode,
        "errorDescription": errorDescription == null ? null : errorDescription,
        "errorSource": errorSource == null ? null : errorSource,
        "errorStep": errorStep == null ? null : errorStep,
        "errorReason": errorReason == null ? null : errorReason,
        "acquirerData": acquirerData == null ? null : acquirerData!.toJson(),
        "settlementId": settlementId == null ? null : settlementIdValues.reverse[settlementId],
        "settlementStatus": settlementStatus == null ? null : settlementStatus,
        "razorpayCreatedAt": razorpayCreatedAt == null ? null : razorpayCreatedAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy == null ? null : updatedBy,
        "RazorpayRefund": razorpayRefund == null ? null : List<dynamic>.from(razorpayRefund!.map((x) => x.toJson())),
    };
}

class AcquirerData {
    AcquirerData({
        this.bankTransactionId,
        this.rrn,
        this.upiTransactionId,
    });

    String? bankTransactionId;
    String? rrn;
    String? upiTransactionId;

    factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        bankTransactionId: json["bank_transaction_id"] == null ? null : json["bank_transaction_id"],
        rrn: json["rrn"] == null ? null : json["rrn"],
        upiTransactionId: json["upi_transaction_id"] == null ? null : json["upi_transaction_id"],
    );

    Map<String, dynamic> toJson() => {
        "bank_transaction_id": bankTransactionId == null ? null : bankTransactionId,
        "rrn": rrn == null ? null : rrn,
        "upi_transaction_id": upiTransactionId == null ? null : upiTransactionId,
    };
}

enum Bank { BARB_R, YESB, IBKL, UTIB, KKBK, ICIC }

final bankValues = EnumValues({
    "BARB_R": Bank.BARB_R,
    "IBKL": Bank.IBKL,
    "ICIC": Bank.ICIC,
    "KKBK": Bank.KKBK,
    "UTIB": Bank.UTIB,
    "YESB": Bank.YESB
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
        this.settlementId,
        this.settlementStatus,
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
    String? currency;
    String? receipt;
    RazorpayRefundRefundStatus? refundStatus;
    String? refundAmount;
    dynamic batchId;
    Speed? speedProcessed;
    Speed? speedRequested;
    SettlementId? settlementId;
    bool? settlementStatus;
    DateTime? razorpayCreatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    AtedBy? createdBy;
    AtedBy? updatedBy;

    factory RazorpayRefund.fromJson(Map<String, dynamic> json) => RazorpayRefund(
        id: json["id"] == null ? null : json["id"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        tenantId: json["tenantId"] == null ? null : json["tenantId"],
        razorpayEventId: json["razorpayEventId"] == null ? null : json["razorpayEventId"],
        razorpayRefundId: json["razorpayRefundId"] == null ? null : json["razorpayRefundId"],
        razorpayPaymentId: json["razorpayPaymentId"] == null ? null : json["razorpayPaymentId"],
        currency: json["currency"] == null ? null : json["currency"],
        receipt: json["receipt"] == null ? null : json["receipt"],
        refundStatus: json["refundStatus"] == null ? null : razorpayRefundRefundStatusValues.map[json["refundStatus"]],
        refundAmount: json["refundAmount"] == null ? null : json["refundAmount"],
        batchId: json["batchId"],
        speedProcessed: json["speedProcessed"] == null ? null : speedValues.map[json["speedProcessed"]],
        speedRequested: json["speedRequested"] == null ? null : speedValues.map[json["speedRequested"]],
        settlementId: json["settlementId"] == null ? null : settlementIdValues.map[json["settlementId"]],
        settlementStatus: json["settlementStatus"] == null ? null : json["settlementStatus"],
        razorpayCreatedAt: json["razorpayCreatedAt"] == null ? null : DateTime.parse(json["razorpayCreatedAt"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"] == null ? null : atedByValues.map[json["createdBy"]],
        updatedBy: json["updatedBy"] == null ? null : atedByValues.map[json["updatedBy"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "orderId": orderId == null ? null : orderId,
        "tenantId": tenantId == null ? null : tenantId,
        "razorpayEventId": razorpayEventId == null ? null : razorpayEventId,
        "razorpayRefundId": razorpayRefundId == null ? null : razorpayRefundId,
        "razorpayPaymentId": razorpayPaymentId == null ? null : razorpayPaymentId,
        "currency": currency == null ? null : currency,
        "receipt": receipt == null ? null : receipt,
        "refundStatus": refundStatus == null ? null : razorpayRefundRefundStatusValues.reverse[refundStatus],
        "refundAmount": refundAmount == null ? null : refundAmount,
        "batchId": batchId,
        "speedProcessed": speedProcessed == null ? null : speedValues.reverse[speedProcessed],
        "speedRequested": speedRequested == null ? null : speedValues.reverse[speedRequested],
        "settlementId": settlementId == null ? null : settlementIdValues.reverse[settlementId],
        "settlementStatus": settlementStatus == null ? null : settlementStatus,
        "razorpayCreatedAt": razorpayCreatedAt == null ? null : razorpayCreatedAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdBy": createdBy == null ? null : atedByValues.reverse[createdBy],
        "updatedBy": updatedBy == null ? null : atedByValues.reverse[updatedBy],
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

enum SettlementId { SETL_KU_TKPW_VLC8_TE3_H }

final settlementIdValues = EnumValues({
    "setl_KuTkpwVLC8te3h": SettlementId.SETL_KU_TKPW_VLC8_TE3_H
});

enum Speed { NORMAL }

final speedValues = EnumValues({
    "normal": Speed.NORMAL
});

enum RazorpayPaymentRefundStatus { FULL }

final razorpayPaymentRefundStatusValues = EnumValues({
    "full": RazorpayPaymentRefundStatus.FULL
});

enum Vpa { SUCCESS_RAZORPAY, JSMINE_OKAXIS, JSMINE97_OKAXIS }

final vpaValues = EnumValues({
    "jsmine97@okaxis": Vpa.JSMINE97_OKAXIS,
    "jsmine@okaxis": Vpa.JSMINE_OKAXIS,
    "success@razorpay": Vpa.SUCCESS_RAZORPAY
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
