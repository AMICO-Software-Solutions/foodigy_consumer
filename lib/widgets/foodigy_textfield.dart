import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';

class SettingsTextFormField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final String? initialValue;
  final bool autoFocus;
  final bool mask;
  final TextInputType keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final int? maxLines;
  const SettingsTextFormField(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.initialValue,
      this.fontSize = 16,
      this.autoFocus = false,
      this.mask = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization,
      this.inputFormatters,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.white),
        child: SizedBox(
          height: 70,
          child: TextFormField(
            obscureText: mask,
            validator: validator,
            //maxLines: maxLines,
            controller: controller,
            autocorrect: false,
            // textCapitalization: textCapitalization ?? TextCapitalization.words,
            keyboardType: keyboardType,
            cursorColor: Colors.red,
            textAlign: TextAlign.start,
            autofocus: autoFocus,
            initialValue: initialValue,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Poppins',
                //fontSize: fontSize,
                fontWeight: FontWeight.w300),
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              errorMaxLines: 2,
              fillColor: textFormColor,
              filled: true,
              hintText: hintText,
              // prefixIcon:Icon(
              //   prefixIcon,
              //   color: Colors.grey,
              // ) ,
              suffixIcon: suffixIcon,
              errorStyle: FoodigyTextStyle.errorStyle,
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(0),
              ),
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  //fontSize: fontSize,
                  fontWeight: FontWeight.w300),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
