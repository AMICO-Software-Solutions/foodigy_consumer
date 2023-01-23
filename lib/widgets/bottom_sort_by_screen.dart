// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/home_screens/view_all_item_pagination_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';

class BottomSortByScreen extends StatefulWidget {
  final Function onPressed;
  final bool isSearch;
  const BottomSortByScreen({super.key, required this.onPressed, required this.isSearch});

  @override
  State<BottomSortByScreen> createState() => _BottomSortByScreenState();
}

class _BottomSortByScreenState extends State<BottomSortByScreen> {
  bool isStrechedDropDown = false;

  bool selected = false;
  List<SortByModel> sortList = [
    SortByModel("Price: High-Low", "desc", Colors.white, false),
    SortByModel("Price: Low-High", "asc", Colors.blueGrey, false),
  ];
  // List<String> sortList = [
  //   'Price: High-Low',
  //   'Price: Low-High'
  // ];

  int? typeValue;
  int? timeValue;
  String title = '';
  String type = '';
  String time = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        children: [
          Container(
              width: 280,
              padding: EdgeInsets.only(right: 0),
              constraints: BoxConstraints(
                minHeight: 45,
                minWidth: 200,
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isStrechedDropDown = !isStrechedDropDown;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        "Sort By",
                        style: FoodigyTextStyle.addressTextStyle,
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 300,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: sortList.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                      activeColor: firstColor,
                      dense: false,
                      title: Text(sortList[index].label,
                          style: FoodigyTextStyle.smallTextStyle),
                      visualDensity:
                          VisualDensity(horizontal: -4.0, vertical: -4),
                      value: index,
                      groupValue: groupValue,
                      onChanged: (val) {
                        setState(() {
                          groupValue = val as int?;
                          title = sortList[index].name;
                          print(title);
                        });
                      });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    // onPressed: () {
                    //   groupValue = null;
                    //   Get.back();
                    //   print(groupValue);
                    // },
                    onPressed: _onButtonPressed,
                    child: Text(
                      'Clear All',
                      style: FoodigyTextStyle.aboutChefStyle,
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sortBy = title;
                        print(sortBy);

                        if(widget.isSearch ==true){
                          Get.back();

                        }else{
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    ViewAllItemPaginationScreen())));

                        }
                      
                        //Get.to(ViewAllItemPaginationScreen());
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(firstColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onButtonPressed() async {
    /* setState(
      () {
        isButtonDisable = true;
      },
    );*/
    await widget.onPressed();
    // ignore: use_build_context_synchronously
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    /* setState(
      () {
        isButtonDisable = false;
      },
    );*/
  }
}

class SortByModel {
  String label, name;
  Color color;
  bool isSelected;
  SortByModel(this.label, this.name, this.color, this.isSelected);
}
