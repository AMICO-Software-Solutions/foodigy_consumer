import 'package:flutter/material.dart';
import 'package:foodigy/controller/order_controller/order_complete_api_controller.dart';
import 'package:foodigy/model/order_completed_model.dart';
import 'package:foodigy/presentation/home_screens/home_screens/view_all_item_pagination_screen.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/orders_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:get/get.dart';

class OrderPlaceScreen extends StatefulWidget {
  final OrderCompletedModel? ordeCompleted;
  const OrderPlaceScreen({super.key, this.ordeCompleted});
  @override
  State<OrderPlaceScreen> createState() => _OrderPlaceScreenState();
}

class _OrderPlaceScreenState extends State<OrderPlaceScreen> {
  OrderCompletedApiController orderCompletedApi=Get.put(OrderCompletedApiController());
  @override
  void initState() {
    orderCompletedApi.orderCompletedList(orderId:widget.ordeCompleted!.orderId.toString() );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
           () {
            if(orderCompletedApi.isDataLoading.isTrue){
              return Center(child: CircularProgressIndicator(),);
            }else {   return SafeArea(
              child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  " Payment successful",
                  style: FoodigyTextStyle.homeHeadLine,
                ),
              
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Order Completed",
                          style: FoodigyTextStyle.aboutChefStyle,
                        )
                      ],
                    ),
                  ),
                ),
          orderCompletedApi.orderCompletedApi!.data!.deliveryMode.toString()=="TAKEAWAY"?      Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup address",
                          style: FoodigyTextStyle.aboutChefStyle,
                        ),
                        Text(
                           orderCompletedApi.orderCompletedApi!.data!.orderAddress.toString(),
                          style: FoodigyTextStyle.aboutChefStyle,
                        )
                      ],
                    ),
                  ),
                ):  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery to this address",
                          style: FoodigyTextStyle.aboutChefStyle,
                        ),
                        Text(
                            orderCompletedApi.orderCompletedApi!.data!.orderAddress.toString(),
                          style: FoodigyTextStyle.aboutChefStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: FoodigyTextStyle.aboutChefStyle,
                        ),SizedBox(
                          width: 30, ),
       Text("$iRubee ${double.parse(orderCompletedApi.orderCompletedApi!.data!.totalCost.toString()).toStringAsFixed(2)}",
                          style: FoodigyTextStyle.amountStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: FoodigyButton(
                          color: firstColor,
                          text: 'Order Status',
                          onPressed: () {
                        //     Get.to(OrderSuccessViewSummary(orderId: widget.ordeCompleted!.orderId.toString(),));
                        //  //  Get.to( OrderSuccessViewSummary(ordeCompleted:widget.ordeCompleted,));
                        // //   Get.to(CheckScreen());
                            Get.off(OrdersScreen());
                          }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: FoodigyButton(
                          color: Colors.white,
                          textColor: firstColor,
                          text: 'Keep Ordering',
                          onPressed: () {
                            Get.offUntil(GetPageRoute(page: () =>ViewAllItemPaginationScreen(),), ModalRoute.withName('toNewLogin') ,);
                         //   Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewAllItemPaginationScreen()));
                           // Get.to(ViewAllItemPaginationScreen());
                          }),
                    )
                  ],
                ),
              ],
            ),
              ),
            );
            }
          }
        ));
  }
}

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});
  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}