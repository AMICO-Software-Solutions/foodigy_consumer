// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  void initState() {
    getFAQ();
    super.initState();
  }

  var chefList = [];

  List productList = [];
  Future<String> getFAQ() async {
    var responseData = await http.get(
      Uri.parse("https://cms-mko4ihns5q-el.a.run.app/faqsconsumers"),
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
        chefList = convert.jsonDecode(responseData.body);

        //  map = json.decode(responseData.body);
        //  print("*************************************");
        //  print(responseData.body);
        //   print(ChefList[2]['id']);
        productList = chefList;

        print("appoint ment is ${productList[0]["question"].toString()}");
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
    return Scaffold(
      appBar: ProfileAppBar(text: 'FAQ'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              // height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey.shade200,
                        thickness: 1,
                      );
                      // return SizedBox(
                      //   height: 20,
                      // );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productList.isEmpty ? 0 : productList.length,
                    itemBuilder: (context, index) {
                      return BuildFAQ(faqData: productList[index],);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildFAQ extends StatefulWidget {
  final Map faqData;
  const BuildFAQ({super.key, required this.faqData});

  @override
  State<BuildFAQ> createState() => _BuildFAQState();
}

class _BuildFAQState extends State<BuildFAQ> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: SizedBox(
            //height: 40,
            width: double.infinity,
            //color: Colors.greenAccent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/1.4
                    ,
                    child: Text(widget.faqData["question"].toString(),
                    style: FoodigyTextStyle.addTocartStyle,
                textAlign: TextAlign.justify,
            //  overflow: TextOverflow.ellipsis,
                ),
                  ), Icon(MdiIcons.chevronDown)]),
          ),
        ),
        
        isOpen == true? Padding(
          padding: const EdgeInsets.only(left:20, top: 10, bottom: 10),
          child: Text(widget.faqData["answer"].toString(), style: FoodigyTextStyle.smallTextStyle,),
        ) : Container()
      ],
    );
  }
}
