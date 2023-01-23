import 'package:flutter/material.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_screen.dart';


class GetCartScreenDetails extends StatefulWidget {
  final String? uId;
   final CartDetailsModel? cartData;
  const GetCartScreenDetails({super.key, this.uId, this.cartData});

  @override
  State<GetCartScreenDetails> createState() => _GetCartScreenDetailsState();
}

class _GetCartScreenDetailsState extends State<GetCartScreenDetails> {
  // GetCartDetailsController cartListController =
  //     Get.put(GetCartDetailsController());
  // @override
  // void initState() {
  //   cartListController.getCartDetails(widget.uId.toString());
  //   super.initState();
  // }

 
  @override
  Widget build(BuildContext context) {
    totalValue = 0;
  //  cartCOntroller.totValu.value = 0;
  
        double height = 80;
        double legnth = widget.cartData!.data!.cartDetails!.length == null
            ? 0
            : widget.cartData!.data!.cartDetails!.length.toDouble();
        double? to;

        to = height * legnth;
        return Column(
              children: [
                SizedBox(
                  height: to,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.cartData== null
                          ? 0
                          : widget.cartData!.data!.cartDetails!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: CartBuildData(
                            cartData: widget.cartData,
                            index: index,
                          ),
                        );
                      }),
                ),
               
              ],
            );
          
        
      
    
  }
}

