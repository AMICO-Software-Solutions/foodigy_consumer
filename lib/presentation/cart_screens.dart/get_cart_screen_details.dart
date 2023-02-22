import 'package:flutter/material.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_screen.dart';

class GetCartScreenDetails extends StatelessWidget {
  final String? uId;
   final CartDetailsModel? cartData;
  const GetCartScreenDetails({super.key, this.uId, this.cartData});
  @override
  Widget build(BuildContext context) {
    totalValue = 0;
        double height = 80;
        double legnth = cartData!.data!.cartDetails!.isEmpty
            ? 0
            : cartData!.data!.cartDetails!.length.toDouble();
        double? to;
        to = height * legnth;
        return Column(
              children: [
                SizedBox(
                  height: to,
                  child: ListView.builder(
                  //  physics: BouncingScrollPhysics(),
                    addAutomaticKeepAlives : false,
                    addRepaintBoundaries : false,
                    addSemanticIndexes : false,
                    clipBehavior : Clip.antiAlias,
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartData== null
                          ? 0
                          : cartData!.data!.cartDetails!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: CartBuildData(
                            cartData: cartData,
                            index: index,
                          ),
                        );
                      }),
                ),
               
              ],
            );
  }
}

