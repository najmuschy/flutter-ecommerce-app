class ProductModel{

  final String id;
  final String description;
  final int currentPrice;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final String title;

  ProductModel({required this.currentPrice,required this.id, required this.photos, required this.colors, required this.sizes, required this.description, required this.title});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData){
    return ProductModel(
      id: jsonData['_id'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      currentPrice: jsonData['current_price'] ?? '',
      photos: List<String>.from(jsonData['photos'] ?? ''),
      colors: List<String>.from(jsonData['colors'] ?? ''),
      sizes: List<String>.from(jsonData['sizes'] ?? ''),
    );
  }
}