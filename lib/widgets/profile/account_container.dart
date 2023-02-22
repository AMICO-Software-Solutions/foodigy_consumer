import 'package:flutter/material.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountContainer extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool isNext;
  const AccountContainer(
      {super.key, this.text, this.icon, required this.isNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          height: 40,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
              icon.toString() =='null' ? Container() :  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Icon(icon  ,color: Colors.grey.shade500,
                    size: 20,)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text.toString(),
                    style: FoodigyTextStyle.addressTextStyle,
                  ),
                ],
              ),
              isNext == false
                  ? Container()
                  : Icon(
                      MdiIcons.chevronRight,
                      color: Colors.grey.shade500,
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
