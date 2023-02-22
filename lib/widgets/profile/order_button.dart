import 'package:flutter/material.dart';

class OrderButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color? textColor;
  final Color buttonColor;

  const OrderButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed,
      this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // decoration: BoxDecoration(border: Border.all(color: widget.color)),
      height: 40,
      child: ElevatedButton(
        onPressed: _onButtonPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(widget.buttonColor),
          // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(5.0),
          //   ),
          // ),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 13,
              color: widget.textColor ?? Colors.white,
              fontFamily: "Poppins",
            ),
          ),
        ),
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
