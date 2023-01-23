import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String text;
  bool? centerTitle;
  Color? backgroundColor;
  Color? textColor;
  double? elevation;
  CustomAppBar(
      {Key? key,
      required this.text,
      this.elevation,
      this.centerTitle,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      iconTheme: IconThemeData(color: Colors.grey.shade500),
      elevation: widget.elevation,
      centerTitle: widget.centerTitle,
      title: Text(
        widget.text,
        style: TextStyle(
            color: widget.textColor,
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
