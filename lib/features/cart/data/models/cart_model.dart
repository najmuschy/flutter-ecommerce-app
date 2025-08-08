import 'package:crafty_bay/features/product/data/model/product_model.dart';

class CartModel{
  final String id;
  final ProductModel productModel ;
  late int quantity ;

  CartModel({required this.id, required this.productModel, required this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
      id: json['_id'],
      productModel: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );

  }
}