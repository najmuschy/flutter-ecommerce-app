import 'dart:math';

import 'package:crafty_bay/features/cart/ui/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

import '../../../../app/app_colors.dart';
import '../../../product/ui/widgets/inc_dec_widget.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartController _cartController = Get.find<CartController>() ;
  @override
  void initState() {

      Get.find<CartController>().getCartList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder(
              init: _cartController,
              builder: (controller){
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical:4 ),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(padding: EdgeInsets.all(8), width:80, height:80 ,child: controller.cartList[index].productModel.photos.isNotEmpty?Image.network(controller.cartList[index].productModel.photos.first):Image.asset('assets/images/no_photo.png')),
                                SizedBox(width: 4,),
                                Expanded(
                                  flex: 20,
                                  child: Column(
                                      spacing: 10,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            Text(getProductTitle(controller.cartList[index].productModel.title), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                            Text('Color:Red, Size: L')
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Text('\$${controller.cartList[index].productModel.currentPrice}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.themeColor),)
                                      ]
                                  ),
                                ),
                                Column(
                                  spacing: 30,
                                  children: [
                                    IconButton(onPressed: (){
                                      _cartController.deleteCartList(controller.cartList[index].id);
                                    }, icon:Icon(Icons.delete_outline, color: Colors.red,)),
                                    IncDecWidget(onChanged: (int value){
                                      _cartController.updateQuantity(controller.cartList[index].productModel.id, value);
                                    })
                                  ],
                                )
                              ]
                          ),
                        ),
                      ),

                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(height: 5),
                  itemCount: _cartController.cartList.length,
                );
              },

            ),
          ),
          buildCartScreenFooterSection(),
        ],
      ),
    );
  }

  Container buildCartScreenFooterSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.themeColor.withAlpha(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              GetBuilder(
                init: _cartController,
                builder: (controller){
                  return Text(
                    _cartController.total.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.themeColor.withAlpha(500),
                    ),
                  );
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () =>payNow(_cartController.total.toDouble()),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
  String getProductTitle(String title){
    if(title.length > 10){
     return '${title.substring(0, 10)}...';
    }
    return title ;
  }

  Future<void> payNow(double amount) async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
          //   ipn_url: "www.ipnurl.com",
            multi_card_name: "visa,master,bkash",
            currency: SSLCurrencyType.BDT,
            product_category: "Any",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "cratf6895ba7cef528",
            store_passwd: "cratf6895ba7cef528@ssl",
            total_amount: amount,
            tran_id: Random().hashCode.toString()));

    final response = await sslcommerz.payNow() ;
    if(response.status== 'VALID'){
      Get.snackbar('Success', 'Payment Successful', colorText: Colors.white, backgroundColor: Colors.green); 
    }
    else if(response.status=='FAILED'){
      Get.snackbar('Failed', 'Payment Failed', colorText: Colors.white, backgroundColor: Colors.red);
    }
    else{
      Get.snackbar('Payment Failed', 'Something went wrong', colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
