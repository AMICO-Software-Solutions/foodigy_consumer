import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodigy/controller/order_controller/order_product_list_review.dart';
import 'package:foodigy/model/order_product_list_review_model.dart';
import 'package:foodigy/model/past_order_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/custom_appbar.dart';
import 'package:foodigy/widgets/profile/order_button.dart';
import 'package:get/get.dart';

class RateOrderScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? productList;
  final List? productIdList;
  final String? bookingDate;
  final PastOrderModel? pastOrder;
  final int index;
  const RateOrderScreen(
      {super.key,
      this.productIdList,
      this.bookingDate,
      this.pastOrder,
      required this.index,
      this.productList});

  @override
  State<RateOrderScreen> createState() => _RateOrderScreenState();
}

class _RateOrderScreenState extends State<RateOrderScreen> {
  OrderProductListController reviewProductController =
      Get.put(OrderProductListController());
  @override
  void initState() {
    print('product list');
    print(widget.productList);
    print(widget.pastOrder!.data![widget.index].orderDetail!.length);
    reviewProductController.orderProductIdList(
        bookingDate: widget.bookingDate, productIdList: widget.productIdList);
    Timer(const Duration(seconds: 2), () {
      proApiproduct();
      // addProduct();
    });
    Timer(const Duration(seconds: 2), () {
      chefAdd();
     
    });
    super.initState();
  }



  List<Map<String,dynamic>> productsList = [];
  var chefsList = [];

TextEditingController commentsController = TextEditingController();

  Map<String, dynamic> proList = {};
  Map<String, dynamic> chefList = {};

void proApiproduct(){
  for(var i=0; i<=reviewProductController.orderProductList!.data!.product!.length; i++){
     proList = {
        "consumerId": int.parse(
            widget.pastOrder!.data![0].consumerId.toString()),
        "chefId": int.parse(
            widget.pastOrder!.data![0].providerId.toString()),
        "ratings": int.parse("4"),
        "productId": int.parse(reviewProductController.orderProductList!.data!.product![i].id
            .toString()),
        "ratingType": "FOOD",
      };
      productsList.add(proList);
  }
}
void chefAdd(){
  productsList.add(
    {
        "consumerId": int.parse(
            widget.pastOrder!.data![0].consumerId.toString()),
        "chefId": int.parse(
            widget.pastOrder!.data![0].providerId.toString()),
        "ratings": int.parse(chefRate.toString()),
        "productId": 0,
        "ratingType": "CHEF",
      }
  );

}


  double chefRate = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        text: "Rate & Review",
      ),
      body: Obx(() {
        if (reviewProductController.isDataLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(
              color: firstColor,
            ),
          );
        }else if(reviewProductController.orderProductList==null){
          return Container();
        }
        
        
         else {
          double height = 50;
          double legnth = reviewProductController
                  .orderProductList!.data!.product!.isEmpty
              ? 0
              : reviewProductController.orderProductList!.data!.product!.length
                  .toDouble();
          double? to;

          to = height * legnth;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/rate_order.png'),
                          fit: BoxFit.fitHeight)),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Review',
                        style: FoodigyTextStyle.aboutChefStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        //  height: 150,
                        height: to,
                        child: ListView.builder(
                            // itemCount: 3,
                            itemCount: reviewProductController
                                    .orderProductList!.data!.product!.isEmpty
                                ? 0
                                : reviewProductController
                                    .orderProductList!.data!.product!.length,
                            itemBuilder: (context, index) {
                              return ProductRatingList(
                                index: index,
                                reviewProductController:
                                    reviewProductController.orderProductList!,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chef Review',
                        style: FoodigyTextStyle.aboutChefStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      reviewProductController.orderProductList!
                                          .data!.inventory!.profileSlug
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  reviewProductController
                                      .orderProductList!.data!.inventory!.title
                                      .toString(),
                                  style: FoodigyTextStyle.aboutChefStyle),
                              SizedBox(
                                height: 30,
                                width: 120,
                                child: FittedBox(
                                  child: RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2,
                                    ),
                                    onRatingUpdate: (rating) {
                                      chefRate = rating;
                                      print(rating);
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(0),
                      //     color: Colors.white,
                      //   ),
                      //   width: 220,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(0.0),
                      //     child: FittedBox(
                      //       child: Row(
                      //         children: [
                      //           RatingBar.builder(
                      //             initialRating: 4.5,
                      //             minRating: 1,
                      //             direction: Axis.horizontal,
                      //             allowHalfRating: true,
                      //             itemCount: 5,
                      //             itemPadding:
                      //                 EdgeInsets.symmetric(horizontal: 0),
                      //             itemBuilder: (context, _) => Icon(
                      //               Icons.star,
                      //               color: Colors.amber,
                      //               size: 5,
                      //             ),
                      //             onRatingUpdate: (rating) {
                      //               print(rating);
                      //             },
                      //           ),
                      //           // SizedBox(
                      //           //   width: 7,
                      //           // ),
                      //           // Text(
                      //           //   "4.4 out of 5",
                      //           //   style: TextStyle(fontSize: 20),
                      //           // ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      
                    ],
                  ),
                ),
               SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Write Review",
                        style: FoodigyTextStyle.addTocartStyle,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: commentsController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Feedback",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              //fontSize: fontSize,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      OrderButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          text: "SUBMIT",
                          onPressed: () {
                            print(widget.productList);
                            print(productsList);
                            //    updateRating();

                            // addProduct(
                            //     productRating: '4',
                            //     chefRating: chefRate.toString());
                            // print(productsList);
                            // print(
                            //     widget.pastOrder!.data![widget.index].orderId);

                            OrderProductListController().postRatingReview(
                              //  productList: widget.productIdList,
                              productList: productsList,
                                orderId: widget
                                    .pastOrder!.data![widget.index].orderId
                                    .toString());

                                    if(commentsController.text.isEmpty){
                                      print('no data');

                                    }else{
                                       OrderProductListController().postComments(
                              comments: commentsController.text,
                                chefId: reviewProductController
                                    .orderProductList!.data!.inventory!.userId
                                    .toString(),
                                consumerId: widget
                                    .pastOrder!.data![widget.index].consumerId
                                    .toString(),
                                orderId: widget
                                    .pastOrder!.data![widget.index].orderId
                                    .toString());
                                    }
                           
                          },
                          buttonColor:firstColor),
                      SizedBox(
                        height: 200,
                      ),
              ]),
            ),
          );
        }
      }),
    );
  }
}

class ProductRatingList extends StatefulWidget {
  final OrderProductIdListModel? reviewProductController;
  final int index;
  final List<Map<String, dynamic>>? productList;
  const ProductRatingList(
      {super.key,
      this.reviewProductController,
      required this.index,
      this.productList});

  @override
  State<ProductRatingList> createState() => _ProductRatingListState();
}

class _ProductRatingListState extends State<ProductRatingList> {
  double productRate = 0.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(children: [
        InkWell(
          onTap: () {
            print(widget.productList);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      widget.reviewProductController!.data!
                          .product![widget.index].productSlug
                          .toString(),
                    ),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                widget.reviewProductController!.data!.product![widget.index]
                    .productName
                    .toString(),
                style: FoodigyTextStyle.aboutChefStyle),
            SizedBox(
              height: 30,
              width: 120,
              child: FittedBox(
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 2,
                  ),
                  onRatingUpdate: (rating) {
                    productRate = rating;
                    print(rating);
                  },
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}

