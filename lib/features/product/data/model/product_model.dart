class ProductModel {
  final String id;
  final String? categoryId;
  final String? categoryTitle;
  final String description;
  final int currentPrice;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final String title;

  ProductModel({
    required this.currentPrice,
    required this.id,
    this.categoryTitle,
    this.categoryId,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.description,
    required this.title,
  });

  factory ProductModel.fromJson(
      Map<String, dynamic> jsonData, {
        String? categoryId,
        String? categoryTitle,
      }) {
    return ProductModel(
      id: jsonData['_id'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      currentPrice: jsonData['current_price'] ?? 0,
      photos: List<String>.from(jsonData['photos'] ?? []),
      colors: List<String>.from(jsonData['colors'] ?? []),
      sizes: List<String>.from(jsonData['sizes'] ?? []),
      categoryId: categoryId,  // Set from controller parameter
      categoryTitle: categoryTitle,  // Set from controller parameter
    );
  }
}