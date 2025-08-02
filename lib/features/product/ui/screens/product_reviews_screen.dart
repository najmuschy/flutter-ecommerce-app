import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import 'add_review_screen.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  static final String name = '/product-reviews';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Reviews')),
      body: Column(
        children: [
          buildReviewCards(context),
          Spacer(),
          buildProductDetailFooterSection(context),
        ],
      ),
    );
  }

  Expanded buildReviewCards(BuildContext context) {
    return Expanded(
          flex: 25,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(int i = 1; i < 5; i++)
                  Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ]
              ),
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(Icons.person_outline, color: Colors.black54,),),
                            Text('Najmus Sakib', style: Theme.of(context).textTheme.headlineMedium,),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text('Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato'),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,)

                ],
              ),
            ),
          ),
        );
  }

  Container buildProductDetailFooterSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
          Text(
            'Reviews(1000)',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddReviewScreen.name);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            icon: Icon(Icons.add, size: 32),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
