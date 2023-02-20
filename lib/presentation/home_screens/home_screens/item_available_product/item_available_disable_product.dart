import 'dart:async';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/glass_blur.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/model/item_available_search_model.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_value.dart';

class ItemAvailableProductDisable extends StatefulWidget {
  final List<Datum>? result;
  final int index;
  const ItemAvailableProductDisable(
      {super.key, this.result, required this.index});

  @override
  State<ItemAvailableProductDisable> createState() =>
      _ItemAvailableProductDisableState();
}

class _ItemAvailableProductDisableState
    extends State<ItemAvailableProductDisable> {
  @override
  void initState() {
    productTime = widget.result![widget.index].productAvailableTime.toString();
    Timer(const Duration(seconds: 0), () {
      maaa();
    });
    super.initState();
  }

  DateTime now = DateTime.now();
//DateTime date = DateTime(now.year, now.month, now.day);
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int? groupValue;
  String title = '';
  int? typeValue;
  int? timeValue;
  String? productTime;
  String? pATIme = '';

  void maaa() {
    setState(() {
      int valu = int.parse(productTime
              .toString()
              .substring(0, productTime.toString().indexOf(':'))) +
          1;
      String one = productTime.toString().substring(2, 5);
      String second =
          productTime.toString().substring(productTime.toString().indexOf(':'));
      String third = productTime
          .toString()
          .substring(productTime.toString().indexOf(':') + 1, 5);

      DateTime date = DateTime(
          2021, 3, 28, 1, 50, 30); // Setting the DateTime to 2021-03-28, 1 AM
      //print(date.add(Duration(minutes: 60)));
      DateTime dateTime = DateTime(
          date.year, date.month, date.day + 1, date.hour + 1, date.minute);
      //   print(dateTime.day);
      var time = "${dateTime.day}, ${dateTime.hour}, ${dateTime.minute}";
      //   print(time);

      //  print(DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
      //     "${dateTime.hour}:${dateTime.minute}:${dateTime.microsecond}")));
      // print('${valu.toString()}${second.toString()}');
      pATIme = "${valu.toString()}${second.toString()}";
      // print('time');
      // print(pATIme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.5, 2),
                  blurRadius: 4,
                  color: Colors.grey.shade500,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey.shade100,
                      BlendMode.saturation,
                    ),
                    child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400,
                            image: DecorationImage(
                                image: NetworkImage(widget
                                    .result![widget.index].productSlug
                                    .toString()),
                                fit: BoxFit.cover))),
                  ),
                  widget.result![widget.index].productAverageRating == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              GlassBlur(
                                child: Container(
                                  height: 40,
                                  color: Colors.white.withOpacity(0.0),
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: RatingBarIndicator(
                                                rating: double.parse(widget
                                                        .result![widget.index]
                                                        .productAverageRating
                                                        .toString())
                                                    .roundToDouble(),
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                unratedColor:
                                                    Colors.amber.withAlpha(50),
                                                direction: Axis.horizontal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 0,
                                            ),
                                            Text(
                                              "(${widget.result![widget.index].productRatingCount})",
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  //  height: ,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.result![widget.index].productTitle
                                .toString(),
                            style:
                                FoodigyTextStyle.itemAvialableDisableTitleStyle,
                          ),
                          RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              children: [
                                TextSpan(
                                    text:
                                        '$iRubee ${widget.result![widget.index].productCost.toString()}',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                TextSpan(
                                    text: '',
                                    style: TextStyle(
                                        fontSize: 7,
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Poppins')),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "By ${widget.result![widget.index].profileName.toString()}",
                            style: FoodigyTextStyle.smallGreyTextStyle,
                          ),
                          widget.result![widget.index].availableCustomization!
                                  .custom!.isEmpty
                              ? SizedBox(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Poppins'),
                                  ),
                                )
                              : Row(
                                  children: const [
                                    SizedBox(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/personalize.png"),
                                        width: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      //   height: 25,
                                      child: Text(
                                        "Personalize",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          widget.result![widget.index].orderCutOffTime
                                      .toString() ==
                                  ""
                              ? Container()
                              : Row(
                                  children: [
                                    Text(
                                      'Order before: ',
                                      style:
                                          FoodigyTextStyle.smallGreyTextStyle,
                                    ),
                                    Text(
                                        widget.result![widget.index]
                                            .orderCutOffTime
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.red,
                                          fontFamily: 'Poppins',
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                          widget.result![widget.index].productAvailableTime
                                      .toString() ==
                                  ""
                              ? Container()
                              : Row(
                                  children: [
                                    Text(
                                      "Delivery Available from:",
                                      style:
                                          FoodigyTextStyle.smallGreyTextStyle,
                                    ),
                                    pATIme == ""
                                        ? Container()
                                        : Text('$pATIme',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: firstColor,
                                              fontFamily: 'Poppins',
                                            ))
                                  ],
                                )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
