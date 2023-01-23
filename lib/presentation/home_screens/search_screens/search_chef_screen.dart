import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:foodigy/controller/popular_chef_controller.dart';
import 'package:foodigy/presentation/chef_screens/chef_page.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchChefScreen extends StatefulWidget {
 final  String? uId;
  const SearchChefScreen({super.key, this.uId});

  @override
  State<SearchChefScreen> createState() => _SearchChefScreenState();
}

class _SearchChefScreenState extends State<SearchChefScreen> {
  PopularChefController popularController = Get.put(PopularChefController());

  List productList = [];
  var ChefList = [];

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

        productList = ChefList[2]["data"]["list"];

        //  print("appoint ment is $productList");
        //  isLoading = false;
      });
    } else {
      print(responseData.body);
    }
    return "success";
  }

  @override
  void initState() {
    getAppoint();
    //  popularController.getPopularChef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   child: Obx(() {
    //     if (popularController.isDataLoading.isTrue) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    return SizedBox(
      height: 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.isEmpty ? 0 : productList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(ChefPage(
                  chefId: productList[index]["chefid"].toString(),
                  uId: widget.uId.toString(),
                  cImage: productList[index]["chefavatar"],
                  cName: productList[index]["chefname"],
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(productList[index]["chefavatar"].toString()), fit: BoxFit.cover),
                          shape: BoxShape.circle),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children:[
                        Text(
                          productList[index]["chefname"].toString(),
                          style: FoodigyTextStyle.addTocartStyle,
                        ),
                        // Text(
                        //   'chennai',
                        //   style: FoodigyTextStyle.smallTextStyle,
                        // )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
    //     }
    //   }),
    // );
  }
}
