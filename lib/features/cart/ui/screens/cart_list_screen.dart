import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../product/ui/widgets/inc_dec_widget.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical:4 ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(padding: EdgeInsets.all(8), width:80, height:80 ,child: Image.asset('assets/images/nike-shoe.png', fit: BoxFit.fill,)),
                          SizedBox(width: 4,),
                          Expanded(
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    Text('New Year Special Shoe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                    Text('Color:Red, Size: L')
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Text('\$100', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.themeColor),)
                              ]
                            ),
                          ),
                          Column(
                            spacing: 30,
                            children: [
                              IconButton(onPressed: (){}, icon:Icon(Icons.delete_outline, color: Colors.red,)),
                              IncDecWidget(onChanged: (int value){})
                            ],
                          )
                          ]
                      ),
                    ),
                  ),

                );
              },
              separatorBuilder: (_, index) => SizedBox(height: 5),
              itemCount: 3,
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
              Text(
                '\$1000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.themeColor.withAlpha(500),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
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
}
