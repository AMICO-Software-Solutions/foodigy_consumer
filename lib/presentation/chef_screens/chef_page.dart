// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodigy/controller/chef_controller/chef_review_controller.dart';
import 'package:foodigy/controller/chef_details_controller.dart';
import 'package:foodigy/presentation/chef_screens/about_chef_screen.dart';
import 'package:foodigy/presentation/chef_screens/chef_order_screen.dart';
import 'package:foodigy/presentation/chef_screens/chefs_menu.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';

class ChefPage extends StatefulWidget {
  const ChefPage({Key? key, this.chefId, this.uId, this.cImage, this.cName})
      : super(key: key);
  final String? chefId, uId, cImage, cName;
  @override
  State<ChefPage> createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage>
    with SingleTickerProviderStateMixin {
  ChefDetailsControllerList chefDetailsController =
      Get.put(ChefDetailsControllerList());
  ChefRatingController chefRating = Get.put(ChefRatingController());
  ChefReviewController chefReviewController = Get.put(ChefReviewController());
  late TabController _tabController;

  @override
  void initState() {
    selectedProductTiming.isEmpty
        ? selectedProductTiming
        : selectedProductTiming.add("ANYTIME");
    chefDetailsController
        .chefDetails(chefId: widget.chefId.toString(), menuTag: []);
    chefRating.chefDetails(chefId: widget.chefId.toString());

    super.initState();

    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        elevation: 1,
        backgroundColor: firstColor,
        title: Text(""),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Column(
                  children: [
                    Obx(() {
                      if (chefDetailsController.isDataLoading.value == true ||
                          chefRating.isDataLoading.isTrue) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: firstColor,
                          ),
                        );
                      } else if (chefDetailsController.chefDetailsList ==
                              null ||
                          chefRating.chefRatingList == null) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              widget.cImage.toString()),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10))),
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.cName.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('By ${widget.cName.toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 10)),
                                  Text('Chennai, Tamil nadu',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10))
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (chefDetailsController
                          .chefDetailsList!.data!.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              widget.cImage.toString()),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10))),
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.cName.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('By ${widget.cName.toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 10)),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              chefDetailsController
                                                  .chefDetailsList!
                                                  .data![0]
                                                  .profileImage
                                                  .toString()),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10))),
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Text(
                                            chefDetailsController
                                                        .chefDetailsList!
                                                        .data![0]
                                                        .profileName
                                                        .toString() ==
                                                    'null'
                                                ? ''
                                                : chefDetailsController
                                                    .chefDetailsList!
                                                    .data![0]
                                                    .profileName
                                                    .toString()
                                                    .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(widget.chefId.toString());
                                            chefReviewController.getChefReviews(
                                                widget.chefId.toString());

                                            showReviewDialog(context);
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: RatingBarIndicator(
                                                  rating: double.parse(
                                                      chefRating
                                                          .chefRatingList!
                                                          .data!
                                                          .chefAverageRating
                                                          .toString()),
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 20.0,
                                                  unratedColor: Colors.amber
                                                      .withAlpha(50),
                                                  direction: Axis.horizontal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "(${chefRating.chefRatingList!.data!.chefRatingCount.toString()})",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text(
                                  //     'By ${chefDetailsController.chefDetailsList!.data![0].profileName.toString() == 'null' ? '' : chefDetailsController.chefDetailsList!.data![0].profileName.toString()}',
                                  //     style: TextStyle(
                                  //         fontFamily: 'Poppins',
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Colors.grey,
                                  //         fontSize: 10)),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/fssai.png"),
                                        height: 20,
                                      ),
                                    ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                        height: 5,
                                      ),
                                          Text(
                                            ' ${chefDetailsController.chefDetailsList!.data![0].fssaiNo.toString()}',
                                            style: FoodigyTextStyle.aboutChefStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Container(
                        color: Colors.white,
                        //  height: 50,
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: firstColor,
                          controller: _tabController,
                          labelColor: firstColor,
                          tabs: const <Widget>[
                            Tab(
                              text: 'About Chef',
                            ),
                            Tab(
                              text: "Chef's Menu",
                            ),
                            Tab(
                              text: 'Your Order',
                            )
                          ],
                          unselectedLabelColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: <Widget>[
                //   Container(),
                AboutChefScreen(
                  chefId: widget.chefId.toString(),
                  uId: widget.uId.toString(),
                ),
                ChefMenu(
                  chefId: widget.chefId.toString(),
                  uId: widget.uId.toString(),
                ),

                ChefOrderScreen(
                  chefId: widget.chefId.toString(),
                  userId: widget.uId,
                )

                // NavigationDrawer()
              ]),
            ),
          ],
        ),
      ),
    );
  }

  showReviewDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(
                'User Reviews',
                style: FoodigyTextStyle.homeHeadLine,
              ),
              //scrollable: true,
              content: SizedBox(
                  child: SizedBox(
                      width: double.maxFinite,
                      height: 300,
                      child: Obx(() {
                        if (chefReviewController.isDataLoading.isTrue) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: firstColor,
                            ),
                          );
                        } else if (chefReviewController.chefsReview == null) {
                          return Center(
                            child: Text(
                              "No reviews",
                              style: FoodigyTextStyle.aboutChefStyle,
                            ),
                          );
                        } else if (chefReviewController
                            .chefsReview!.data!.isEmpty) {
                          return Center(
                            child: Text(
                              "No reviews",
                              style: FoodigyTextStyle.aboutChefStyle,
                            ),
                          );
                        } else {
                          return ListView.separated(
                            itemCount: chefReviewController.chefsReview!.data!.isEmpty
                                ? 0
                                : chefReviewController.chefsReview!.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Row(children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        chefReviewController.chefsReview!
                                            .data![index].consumerName
                                            .toString(),
                                        style: FoodigyTextStyle.aboutChefStyle,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        chefReviewController
                                            .chefsReview!.data![index].comments
                                            .toString(),
                                        style: FoodigyTextStyle.aboutChefStyle,
                                      ),
                                    ],
                                  )
                                ]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey.shade200,
                              );
                            },
                          );
                        }
                      }))),
            
          );
        },
      );
}
