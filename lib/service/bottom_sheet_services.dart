// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/search_screens/home_search_screen.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/bottom_filter_screen.dart';
import 'package:foodigy/widgets/bottom_sort_by_screen.dart';
import 'package:get/get.dart';

class BottomSheetService {
  Future<dynamic> foodigyFilter(BuildContext context, bool isSearch) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FilterBottom(
          isSearch: isSearch,
        );
      },
    );
  }

  Future<dynamic> aloSortSheet(BuildContext context, bool isSearch) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSortByScreen(
          isSearch: isSearch,
          onPressed: () {
            if (isSearch == true) {
               Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    HomeSearchScreen())));
            } else {
              groupValue = null;
              Get.back();
              print(groupValue);
            }
          },
        );
      },
    );
  }
}
