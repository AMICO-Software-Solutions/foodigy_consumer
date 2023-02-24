import 'package:declarative_refresh_indicator/declarative_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/order_controller/active_order_controller.dart';
import 'package:foodigy/controller/order_controller/past_order_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/active_order_list.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/past_order_list.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
   ActiveOrderController activeController = Get.put(ActiveOrderController());
    PastOrderController pastController = Get.put(PastOrderController());
    @override
  void initState() {
   // registerController.getProfile();
    //  cartTimer.getMaxTiming();
    //cartTimer.updateItemTimingList();
    super.initState();
      //   _load();
  }

  var _loading = false;
  var forceShowIndicator = false;
  void _load() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 0));
  activeController.activeOrderList();
    await Future<void>.delayed(const Duration(seconds: 1));
  pastController.pastOrderList();
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :ProfileAppBar(text: 'Orders') ,
      body: DeclarativeRefreshIndicator(
        refreshing: _loading || forceShowIndicator,
        onRefresh: _load,
        color: firstColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 30,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.3,
                                  spreadRadius: 0.0,
                                ),
                              ]),
                          child: Icon(
                            MdiIcons.refresh,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Pull down to refresh",
                          style: FoodigyTextStyle.addressTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              
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
      ),
    );
  }
}