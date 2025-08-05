import 'package:crafty_bay/features/home/data/model/home_carousel_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';
import '../../../product/data/model/product_category_model.dart';

class HomeCarouselController extends GetxController{

  final List<HomeCarouselModel> _homeCarouselModels = [] ;
  List<HomeCarouselModel> get homeCarouselModels => _homeCarouselModels ;

  bool _carouselInProgress = false ;
  bool get carouselInProgress => _carouselInProgress ;

  String? _message ;
  String get message => _message! ;

  Future<void> getHomeCarousel() async{
    _carouselInProgress = true ;
    update();

    _homeCarouselModels.clear() ;

    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(Urls.slidesUrl);

    if(response.isSuccess){
     for(Map<String, dynamic> data in response.data!['data']['results']){
        HomeCarouselModel carouselModel = HomeCarouselModel.fromJson(data);
        _homeCarouselModels.add(carouselModel);
     }
    }
    else{
      _message = response.errorMessage! ;

    }

    _carouselInProgress = false ;
    update();

  }


}