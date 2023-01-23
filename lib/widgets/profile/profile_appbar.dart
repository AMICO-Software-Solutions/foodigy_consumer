import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget  {
  final String text;
  const ProfileAppBar({super.key, required this.text});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
    @override
    Size get preferredSize => Size.fromHeight(60.0);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: firstColor,
      title: Text(
        widget.text,
        style: FoodigyTextStyle.profileTitleStyle,
      ),
    );
  }
}
