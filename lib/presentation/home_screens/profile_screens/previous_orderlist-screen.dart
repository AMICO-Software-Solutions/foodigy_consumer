

import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/past_order_list.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';

class PreviousOrderListScreen extends StatefulWidget {
  const PreviousOrderListScreen({super.key});

  @override
  State<PreviousOrderListScreen> createState() => _PreviousOrderListScreenState();
}

class _PreviousOrderListScreenState extends State<PreviousOrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(text: 'Previous Order'),
      body:  SingleChildScrollView(child: PastOrderList()),
    );
  }
}