import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/active_order_list.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/past_order_list.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :ProfileAppBar(text: 'Orders') ,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
           Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Active Orders", style: FoodigyTextStyle.homeHeadLine,),
            ),
          ActiveOrderList(),
           Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Past orders", style: FoodigyTextStyle.homeHeadLine,),
            ),
            PastOrderList()
        ],
        
        ),
      ),
    );
  }
}