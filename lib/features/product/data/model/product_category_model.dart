class ProductCategoryModel{

  final String id;
  final String iconUrl;
  final String title;

  ProductCategoryModel({required this.id, required this.iconUrl, required this.title});

  factory ProductCategoryModel.fromJson(Map<String, dynamic> jsonData){
    return ProductCategoryModel(
      id: jsonData['_id'] ?? '',
      iconUrl: jsonData['icon'] ?? '',
      title: jsonData['title'] ?? '',
    );
  }
}