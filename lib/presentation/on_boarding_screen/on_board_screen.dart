// ignore_for_file: avoid_print

import 'package:flutter/services.dart';
import 'package:foodigy/controller/cms_controller/search_address_controller.dart';
import 'package:foodigy/controller/onboading_controller.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import '../../utilities/const_value.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  OnboadingController onboadingController = Get.put(OnboadingController());
  SearchAddressController searchAddressController =Get.put(SearchAddressController());
  int currentIndex = 0;
  late PageController _controller;
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    onboadingController.getOnboading();
    //  getImages();
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (onboadingController.isDataLoading.value == true) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: firstColor,
                    ));
                  }
                  return PageView.builder(
                    controller: _controller,
                    itemCount: onboadingController.productList.length,
                    // itemCount: contents.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2.1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(onboadingController
                                              .productList[i].image![0].url
                                              .toString()
                                          //  da[i]['image'][0]['url'].toString()
                                          ),
                                      fit: BoxFit.fitHeight)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 36),
                                        children: [
                                          TextSpan(
                                              text: onboadingController
                                                  .productList[i].title
                                                  .toString(),
                                              // text: da[i]['title'],
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black)),
                                          // TextSpan(
                                          //     text: da[i]['title'],
                                          //     style: TextStyle(
                                          //         fontSize: 25,
                                          //         fontWeight: FontWeight.w600,
                                          //         fontFamily: 'Poppins',
                                          //         color: firstColor))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      onboadingController
                                          .productList[i].description
                                          .toString(),
                                      // da[i]['description'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
              /* Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),*/
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      child: Builder(builder: (context) {
                        if (currentIndex == 0) {
                          return Row(
                            children: [
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: firstColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.grey,
                              )
                            ],
                          );
                        } else if (currentIndex == 1) {
                          return Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: firstColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.grey,
                              )
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: firstColor),
                              ),
                            ],
                          );
                        }
                        // return Text(
                        //   '2/3',
                        //   style: TextStyle(
                        //       color: Colors.grey,
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 25),
                        // );
                      }),
                    ),
                    // currentIndex == 2
                    //     ?
                    Column(
                      children: [
                        Container(
                            height: 45,
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: FoodigyButton(
                                color: firstColor,
                                text: 'Explore menu',
                                onPressed: () {
                                  foodigyBottomSheet(context);
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (_) => LoginSCreen()));
                                  //   Get.to(CurrentLocationScreen());
                                })),
                        InkWell(
                          onTap: () {
                            Get.to(LoginSCreen());
                          },
                          child: SizedBox(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.grey.shade300),
                            //   borderRadius: BorderRadius.circular(5),
                            //   color: Color.fromARGB(255, 255, 255, 255),
                            // ),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'or Login',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.grey.shade400,
                                      fontSize: 15,
                                      fontFamily: 'Poppins'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    // : Container(
                    //     height: 45,
                    //     margin: EdgeInsets.all(10),
                    //     width: MediaQuery.of(context).size.width / 1.2,
                    //     child: FoodigyButton(
                    //         color: firstColor,
                    //         text: 'Explore menu',
                    //         onPressed: () {
                    //           foodigyBottomSheet(context);
                    //           //Get.to(CurrentLocationScreen());
                    //         })),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<dynamic> foodigyBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
      return SearchAddressBottomSheet(addressController: addressController, 
     // searchAddressController: searchAddressController
      );
          });
        // return AnimatedPadding(
        //   padding: MediaQuery.of(context).viewInsets,
        //   duration: const Duration(milliseconds: 100),
        //   child: SizedBox(
        //     height: 120,
        //     child: Padding(
        //       padding: const EdgeInsets.all(20.0),
        //       child: Column(
        //         children: [
        //           Container(
        //             height: 55,
        //             width: double.infinity,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(5),
        //                 border: Border.all(color: Colors.grey)),
        //             child: TextFormField(
        //               controller: addressController,
        //               keyboardType:
        //                   const TextInputType.numberWithOptions(decimal: true),
        //               inputFormatters: [
        //                 FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
        //                 LengthLimitingTextInputFormatter(6)
        //               ],
        //               decoration: InputDecoration(
        //                   prefixIcon: Icon(
        //                     MdiIcons.mapMarker,
        //                     color: firstColor,
        //                     size: 23,
        //                   ),
        //                   suffixIcon: Padding(
        //                     padding: const EdgeInsets.all(10.0),
        //                     child: InkWell(
        //                       onTap: () {
        //                         setState(() {
        //                           getAddress(address: addressController.text);
        //                           add = addressController.text;
        //                         });
        //                       },
        //                       child: Container(
        //                         alignment: Alignment.center,
        //                         height: 1,
        //                         width: 15,
        //                         decoration: BoxDecoration(
        //                             color: firstColor,
        //                             border: Border.all(color: firstColor),
        //                             borderRadius: BorderRadius.circular(5)),
        //                         child: const Text(
        //                           "Go",
        //                           style: FoodigyTextStyle.profileTitleStyle,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   border: InputBorder.none,
        //                   hintText: 'Enter PinCode',
        //                   hintStyle: FoodigyTextStyle.addressTextStyle),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           // FoodigyButton(
        //           //     color: firstColor,
        //           //     text: "Confirm location",
        //           //     onPressed: () {
        //           //       getAddress(address: addressController.text);
        //           //       add = addressController.text;
        //           //     }),
        //           // SizedBox(
        //           //   height: 20,
        //           // ),
        //           // FoodigyButton(
        //           //     color: firstColor,
        //           //     text: "Current location",
        //           //     onPressed: () {
        //           //       Get.to(CurrentLocationScreen(isSearch: false));
        //           //     })
        //         ],
        //       ),
        //     ),
        //   ),
        // );
     },
    );
  }


}

class SearchAddressBottomSheet extends StatefulWidget {
  const SearchAddressBottomSheet({
    Key? key,
    required this.addressController,
   // required this.searchAddressController,
  }) : super(key: key);

final TextEditingController addressController;
 // final SearchAddressController searchAddressController;

  @override
  State<SearchAddressBottomSheet> createState() => _SearchAddressBottomSheetState();
}

class _SearchAddressBottomSheetState extends State<SearchAddressBottomSheet> {
  SearchAddressController searchAddressController =Get.put(SearchAddressController());
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
            padding: MediaQuery.of(context).viewPadding,
            duration: const Duration(milliseconds: 100),
            child: SizedBox(
             // height: 120,
                 height:MediaQuery.of(context).size.height/2.4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          child: TextFormField(
                            controller: widget.addressController,
                                           keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                        LengthLimitingTextInputFormatter(6)
                      ],
                            decoration: InputDecoration(
                                // prefixIcon: Icon(
                                //   MdiIcons.mapMarker,
                                //   color: firstColor,
                                //   size: 23,
                                // ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    
                                    child: Obx(
                           () {
                                      if(searchAddressController.isLoading.isTrue){
                                       return  Container(
                                            alignment: Alignment.center,
                                            height: 1,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                border: Border.all(color: Colors.grey.shade300),
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              "Go",
                                              style: FoodigyTextStyle.profileTitleStyle,
                                            ),
                                          
                                        );
                                      }else{
                                        return InkWell(
                                          onTap: () {
                                  //    setState(() {
                                      searchAddressController.getAddress(address: widget.addressController.text);
                                        add = widget.addressController.text;
                                     // });
                                    },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 1,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: firstColor,
                                                border: Border.all(color: firstColor),
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              "Go",
                                              style: FoodigyTextStyle.profileTitleStyle,
                                            ),
                                          ),
                                        );
                                      }
                                        
                                      }
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: 'Enter Location(Pin Code or Address)',
                                hintStyle: FoodigyTextStyle.addressTextStyle),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // FoodigyButton(
                        //     color: firstColor,
                        //     text: "Confirm location",
                        //     onPressed: () {
                        //       getAddress(address: addressController.text);
                        //       add = addressController.text;
                        //     }),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // FoodigyButton(
                        //     color: firstColor,
                        //     text: "Current location",
                        //     onPressed: () {
                        //       Get.to(CurrentLocationScreen(isSearch: false));
                        //     })
                      ],
                    ),
                  ),
                )
            
          );
  }
}
