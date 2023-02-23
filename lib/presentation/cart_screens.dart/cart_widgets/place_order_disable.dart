
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class placeOrderButtondisable extends StatelessWidget {
  const placeOrderButtondisable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        // ignore: sort_child_properties_last
        child: Text(
          "Place order",
          style: TextStyle(color: Colors.grey),
        ),
        style: TextButton.styleFrom(
            foregroundColor: Colors.purple, backgroundColor: Colors.grey.shade200,
            textStyle: const TextStyle(fontSize: 14, fontFamily: 'Poppins')),
        onPressed: () {},
      ),
    );
  }
}
