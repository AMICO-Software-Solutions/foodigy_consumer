

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodigy/model/order_completed_model.dart';
import 'package:foodigy/presentation/chef_screens/order_placed.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';

class OrderLoaderScreen extends StatefulWidget {
  final  OrderCompletedModel? orderCompleted;
  const OrderLoaderScreen({super.key, this.orderCompleted});

  @override
  State<OrderLoaderScreen> createState() => _OrderLoaderScreenState();
}

class _OrderLoaderScreenState extends State<OrderLoaderScreen> {
    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
       Get.to(()=>OrderPlaceScreen(
           ordeCompleted: widget.orderCompleted,
        ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: firstColor,)),
    );
  }
}