class HomeCarouselModel{

  final String id;
  final String photoUrl;
  final String description;

  HomeCarouselModel({required this.id, required this.photoUrl, required this.description});

  factory HomeCarouselModel.fromJson(Map<String, dynamic> jsonData){
    return HomeCarouselModel(
      id: jsonData['_id'] ?? '',
      photoUrl: jsonData['photo_url'] ?? '',
      description: jsonData['description'] ?? '',
    );
  }
}