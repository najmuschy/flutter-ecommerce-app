import 'package:flutter/material.dart';

import '../../../common/ui/widgets/product_card.dart';

class WishedProductListScreen extends StatefulWidget {
  const WishedProductListScreen({super.key});




  @override
  State<WishedProductListScreen> createState() => _WishedProductListScreenState();
}

class _WishedProductListScreenState extends State<WishedProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return FittedBox(
              // child: ProductCard()
          );
        },
      ),
    );
  }
}
