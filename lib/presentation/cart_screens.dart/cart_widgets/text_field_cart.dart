import 'package:flutter/material.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';

class TextFieldCart extends StatelessWidget {
  const TextFieldCart({
    Key? key,
    required this.noteController,
  }) : super(key: key);

  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextField(
          controller: noteController,
          readOnly: false,
          autofocus: false,
          autocorrect: false,
          scribbleEnabled: false,
          decoration: InputDecoration(
              hintText: "Cooking Instructions (Optional)",
              hintStyle: FoodigyTextStyle.addressTextStyle),
        ),
      ),
    );
  }
}