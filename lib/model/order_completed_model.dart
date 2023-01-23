// To parse this JSON data, do
//
//     final orderCompletedModel = orderCompletedModelFromJson(jsonString);

import 'dart:convert';

OrderCompletedModel orderCompletedModelFromJson(String str) => OrderCompletedModel.fromJson(json.decode(str));

String orderCompletedModelToJson(OrderCompletedModel data) => json.encode(data.toJson());

class OrderCompletedModel {
    OrderCompletedModel({
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
    dynamic refundStatus;
    bool? capture;
    dynamic cardId;
    dynamic card;
    String? bank;
    dynamic wallet;
    dynamic vpa;
    String? email;
    String? contact;
    String? fee;
    String? tax;
    dynamic errorCode;
    dynamic errorDescription;
    dynamic errorSource;
    dynamic errorStep;
    dynamic errorReason;
    AcquirerData? acquirerData;
    DateTime? razorpayCreatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;

    factory OrderCompletedModel.fromJson(Map<String, dynamic> json) => OrderCompletedModel(
        id: json["id"],
        tenantId: json["tenantId"],
        orderId: json["orderId"],
        razorpayEventId: json["razorpayEventId"],
        razorpayOrderId: json["razorpayOrderId"],
        razorpayPaymentId: json["razorpayPaymentId"],
        amount: json["amount"],
        currency: json["currency"],
        paymentStatus: json["paymentStatus"],
        paymentMode: json["paymentMode"],
        international: json["international"],
        amountRefunded: json["amountRefunded"],
        refundStatus: json["refundStatus"],
        capture: json["capture"],
        cardId: json["cardId"],
        card: json["card"],
        bank: json["bank"],
        wallet: json["wallet"],
        vpa: json["vpa"],
        email: json["email"],
        contact: json["contact"],
        fee: json["fee"],
        tax: json["tax"],
        errorCode: json["errorCode"],
        errorDescription: json["errorDescription"],
        errorSource: json["errorSource"],
        errorStep: json["errorStep"],
        errorReason: json["errorReason"],
        acquirerData: AcquirerData.fromJson(json["acquirerData"]),
        razorpayCreatedAt: DateTime.parse(json["razorpayCreatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tenantId": tenantId,
        "orderId": orderId,
        "razorpayEventId": razorpayEventId,
        "razorpayOrderId": razorpayOrderId,
        "razorpayPaymentId": razorpayPaymentId,
        "amount": amount,
        "currency": currency,
        "paymentStatus": paymentStatus,
        "paymentMode": paymentMode,
        "international": international,
        "amountRefunded": amountRefunded,
        "refundStatus": refundStatus,
        "capture": capture,
        "cardId": cardId,
        "card": card,
        "bank": bank,
        "wallet": wallet,
        "vpa": vpa,
        "email": email,
        "contact": contact,
        "fee": fee,
        "tax": tax,
        "errorCode": errorCode,
        "errorDescription": errorDescription,
        "errorSource": errorSource,
        "errorStep": errorStep,
        "errorReason": errorReason,
        "acquirerData": acquirerData!.toJson(),
        "razorpayCreatedAt": razorpayCreatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
    };
}

class AcquirerData {
    AcquirerData({
        this.bankTransactionId,
    });

    String? bankTransactionId;

    factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        bankTransactionId: json["bank_transaction_id"],
    );

    Map<String, dynamic> toJson() => {
        "bank_transaction_id": bankTransactionId,
    };
}
