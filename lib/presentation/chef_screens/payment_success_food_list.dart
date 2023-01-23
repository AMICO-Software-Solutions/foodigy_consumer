
import 'package:flutter/material.dart';
import 'package:foodigy/model/order_complete_api_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';

class PayMentSuccessFoodList extends StatefulWidget {
  final   OrderCompleteApiModel? orderCompletedApi;
  const PayMentSuccessFoodList({super.key, this.orderCompletedApi});

  @override
  State<PayMentSuccessFoodList> createState() => _PayMentSuccessFoodListState();
}

class _PayMentSuccessFoodListState extends State<PayMentSuccessFoodList> {
  
  @override
  Widget build(BuildContext context) {
        double height = 50;
    double legnth = widget.orderCompletedApi!.data!.orderDetail!.isEmpty
        ? 0
        : widget.orderCompletedApi!.data!.orderDetail!.length.toDouble();
   double? to ;

    to = height * legnth;
     //  int discountValue=  int.parse(orderCompletedApi.orderCompletedApi!.data!.couponCost.toString());
    return    Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                 //  height: 100,
                   height: to,
                    width: double.infinity,
                    color: Colors.white,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(widget.orderCompletedApi!.data!.orderDetail!
                                                  [index].productSlug
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                   widget.orderCompletedApi!.data!.orderDetail![index].productName
                                              .toString(),
                                          style: FoodigyTextStyle.addTocartStyle,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                         widget.orderCompletedApi!.data!.orderDetail![index].quantity
                                                  .toString(),
                                              style:
                                                  FoodigyTextStyle.aboutChefStyle,
                                            ),
                                            Text(" x ",
                                                style: FoodigyTextStyle
                                                    .aboutChefStyle),
                                            Text(
                                                "$iRubee${double.parse(widget.orderCompletedApi!.data!.orderDetail![index].cost.toString()).toStringAsFixed(2)}",
                                                style:
                                                    FoodigyTextStyle.amountStyle)
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "$iRubee${double.parse(widget.orderCompletedApi!.data!.orderDetail![index].total.toString()).toStringAsFixed(2)}",
                                    style: FoodigyTextStyle.amountStyle)
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount:widget.orderCompletedApi!.data!.orderDetail!.length,
                     //   itemCount: widget.orderList!.length
                        ),
                  ),
                ),
              );
  }
}