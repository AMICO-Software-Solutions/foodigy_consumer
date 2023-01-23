import 'package:flutter/material.dart';

class FoodigyButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color? textColor;

  const FoodigyButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed, 
     this.textColor})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FoodigyButtonState createState() => _FoodigyButtonState();
}

class _FoodigyButtonState extends State<FoodigyButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: _onButtonPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(widget.color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 16, color:widget.textColor ?? Colors.white),
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
