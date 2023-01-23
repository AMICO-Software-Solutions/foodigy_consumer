// To parse this JSON data, do
//
//     final dunzoModel = dunzoModelFromJson(jsonString);

import 'dart:convert';

DunzoModel dunzoModelFromJson(String str) => DunzoModel.fromJson(json.decode(str));

String dunzoModelToJson(DunzoModel data) => json.encode(data.toJson());

class DunzoModel {
    DunzoModel({
        this.distance,
        this.estimatedPrice,
        this.estimatedPriceBreakup,
        this.eta,
        this.dropOrder,
    });

    double? distance;
    int? estimatedPrice;
    EstimatedPriceBreakup? estimatedPriceBreakup;
    Eta? eta;
    List<String>? dropOrder;

    factory DunzoModel.fromJson(Map<String, dynamic> json) => DunzoModel(
        distance: json["distance"].toDouble(),
        estimatedPrice: json["estimated_price"],
        estimatedPriceBreakup: EstimatedPriceBreakup.fromJson(json["estimated_price_breakup"]),
        eta: Eta.fromJson(json["eta"]),
        dropOrder: List<String>.from(json["drop_order"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "estimated_price": estimatedPrice,
        "estimated_price_breakup": estimatedPriceBreakup!.toJson(),
        "eta": eta!.toJson(),
        "drop_order": List<dynamic>.from(dropOrder!.map((x) => x)),
    };
}

class EstimatedPriceBreakup {
    EstimatedPriceBreakup({
        this.deliveryCharge,
        this.deliveryChargeBreakup,
        this.codTxnFee,
        this.codTxnFeeBreakup,
    });

    int? deliveryCharge;
    DeliveryChargeBreakup? deliveryChargeBreakup;
    int? codTxnFee;
    dynamic codTxnFeeBreakup;

    factory EstimatedPriceBreakup.fromJson(Map<String, dynamic> json) => EstimatedPriceBreakup(
        deliveryCharge: json["delivery_charge"],
        deliveryChargeBreakup: DeliveryChargeBreakup.fromJson(json["delivery_charge_breakup"]),
        codTxnFee: json["cod_txn_fee"],
        codTxnFeeBreakup: json["cod_txn_fee_breakup"],
    );

    Map<String, dynamic> toJson() => {
        "delivery_charge": deliveryCharge,
        "delivery_charge_breakup": deliveryChargeBreakup!.toJson(),
        "cod_txn_fee": codTxnFee,
        "cod_txn_fee_breakup": codTxnFeeBreakup,
    };
}

class DeliveryChargeBreakup {
    DeliveryChargeBreakup({
        this.baseDeliveryCharge,
        this.totalGstAmount,
        this.gstBreakup,
        this.surge,
        this.surgeMultiplier,
        this.multiDropPrice,
        this.multiDropPricePerDrop,
    });

    int? baseDeliveryCharge;
    int? totalGstAmount;
    GstBreakup? gstBreakup;
    int? surge;
    int? surgeMultiplier;
    int? multiDropPrice;
    int? multiDropPricePerDrop;

    factory DeliveryChargeBreakup.fromJson(Map<String, dynamic> json) => DeliveryChargeBreakup(
        baseDeliveryCharge: json["base_delivery_charge"],
        totalGstAmount: json["total_gst_amount"],
        gstBreakup: GstBreakup.fromJson(json["gst_breakup"]),
        surge: json["surge"],
        surgeMultiplier: json["surge_multiplier"],
        multiDropPrice: json["multi_drop_price"],
        multiDropPricePerDrop: json["multi_drop_price_per_drop"],
    );

    Map<String, dynamic> toJson() => {
        "base_delivery_charge": baseDeliveryCharge,
        "total_gst_amount": totalGstAmount,
        "gst_breakup": gstBreakup!.toJson(),
        "surge": surge,
        "surge_multiplier": surgeMultiplier,
        "multi_drop_price": multiDropPrice,
        "multi_drop_price_per_drop": multiDropPricePerDrop,
    };
}

class GstBreakup {
    GstBreakup({
        this.cgst,
        this.sgst,
        this.igst,
        this.roundOff,
        this.cgstPercentage,
        this.sgstPercentage,
        this.igstPercentage,
    });

    double? cgst;
    double? sgst;
    int? igst;
    double? roundOff;
    int? cgstPercentage;
    int? sgstPercentage;
    int? igstPercentage;

    factory GstBreakup.fromJson(Map<String, dynamic> json) => GstBreakup(
        cgst: json["cgst"].toDouble(),
        sgst: json["sgst"].toDouble(),
        igst: json["igst"],
        roundOff: json["round_off"].toDouble(),
        cgstPercentage: json["cgst_percentage"],
        sgstPercentage: json["sgst_percentage"],
        igstPercentage: json["igst_percentage"],
    );

    Map<String, dynamic> toJson() => {
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "round_off": roundOff,
        "cgst_percentage": cgstPercentage,
        "sgst_percentage": sgstPercentage,
        "igst_percentage": igstPercentage,
    };
}

class Eta {
    Eta({
        this.pickup,
        this.dropoff,
    });

    int? pickup;
    int? dropoff;

    factory Eta.fromJson(Map<String, dynamic> json) => Eta(
        pickup: json["pickup"],
        dropoff: json["dropoff"],
    );

    Map<String, dynamic> toJson() => {
        "pickup": pickup,
        "dropoff": dropoff,
    };
}
