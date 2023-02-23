import 'package:flutter/material.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.red,
                )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  child: SizedBox(
                      child: Row(children: const [
                    Text(
                      "Choose delivery type*",
                      style: FoodigyTextStyle.addTocartStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      MdiIcons.chevronDown,
                      size: 18,
                    )
                  ])),
                ),
              ),
              Text(
                "Please select delivery type",
                style: FoodigyTextStyle.errorStyle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
