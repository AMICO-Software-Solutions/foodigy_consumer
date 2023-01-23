// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/popular_chef_controller.dart';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/presentation/chef_screens/chef_page.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_design.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PopularChefDetails extends StatefulWidget {
  final String? uId;
  const PopularChefDetails({Key? key, this.uId}) : super(key: key);

  @override
  State<PopularChefDetails> createState() => _PopularChefDetailsState();
}

class _PopularChefDetailsState extends State<PopularChefDetails> {
  PopularChefController popularController = Get.put(PopularChefController());

  // @override
  // void initState() {
  //   popularController.getPopularChef();
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();
    getAppoint();
  }

  var ChefList = [];
  List productList = [];

  Map<String, dynamic> map = {};
  Future<String> getAppoint() async {
    var responseData = await http.get(
      Uri.parse("https://cms-mko4ihns5q-el.a.run.app/consumerlandings"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${cmsToken.toString()}',
      },
    );
    // print(" reponse is ${responseData.statusCode}");

    if (responseData.statusCode == 200 ||
        responseData.statusCode == 201 ||
        responseData.statusCode == 202) {
      setState(() {
        ChefList = convert.jsonDecode(responseData.body);

        //  map = json.decode(responseData.body);
        //  print("*************************************");
        //  print(responseData.body);
        //   print(ChefList[2]['id']);
        productList = ChefList[2]["data"]["list"];

        //  print("appoint ment is $productList");
        //  isLoading = false;
      });
    } else if (responseData.statusCode == 401) {
      Map<String, dynamic> map = {};
      map = convert.jsonDecode(responseData.body);
      print(map['message'].toString());
      if (map['message'] == "Invalid token.") {
        print('success');
        TokenGeneretor().createCMSToken();
      } else {
        print('failure');
      }
    } else {
      print(responseData.body);
    }
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: double.infinity,
      child: FutureBuilder(
          future: getAppoint(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.isEmpty ? 0 : productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(ChefPage(
                            chefId: productList[index]["chefid"].toString(),
                            uId: widget.uId.toString(),
                            cImage: productList[index]["chefavatar"],
                            cName: productList[index]["chefname"],
                          ));
                        },
                        child: Container(
                          height: 200,
                          width: 155,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: homeImageContainerHeight,
                                  width: homeImageContainerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            productList[index]["chefavatar"]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/chefhat.png"),
                                        width: 20,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          // width: 100,
                                          child: Text(
                                            ' ${productList[index]["chefname"].toString()}',
                                            //  textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                        // Text(
                                        //   'By ${productList[index]["searchname"]}',
                                        //   style: FoodigyTextStyle
                                        //       .smallTextStyle,
                                        // )
                                      ],
                                    ),
                                    // Container(
                                    //   height: 25,
                                    //   width: 25,
                                    //   decoration: BoxDecoration(
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(
                                    //               productList[index]
                                    //                   ["image"]),
                                    //           fit: BoxFit.cover),
                                    //       shape: BoxShape.circle),
                                    // )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
