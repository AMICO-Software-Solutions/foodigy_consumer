
import 'package:flutter/material.dart';

class CustomDialogueBox extends StatefulWidget {
  final double? height;
  final String? title, description;
  final String? buttonOne;
  final Function? buttonOnePressed;
  final Function? buttonTwoPressed;
  final String? buttonTwo;

  const CustomDialogueBox(
      {Key? key,
      this.title,
      this.description,
      this.height,
      this.buttonOne,
      this.buttonTwo,
      this.buttonOnePressed,
      this.buttonTwoPressed})
      : super(key: key);

  @override
  State<CustomDialogueBox> createState() => _CustomDialogueBoxState();
}

class _CustomDialogueBoxState extends State<CustomDialogueBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: widget.height,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.description!,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       height: 50,
              //       width: MediaQuery.of(context).size.width / 3.5,
              //       child: AloButton(
              //           color: firstColor,
              //           text: widget.buttonOne!,
              //           onPressed: () {}),
              //     ),
              //     SizedBox(
              //       height: 50,
              //       width: MediaQuery.of(context).size.width / 3.5,
              //       child: AloButton(
              //         color: firstColor,
              //         text: widget.buttonTwo!,
              //         onPressed: () {},
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
