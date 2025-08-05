import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_colors.dart';
import '../../data/model/product_model.dart';



class ProductCarousel extends StatefulWidget {
  ProductCarousel({super.key, required this.photos});

  List<String> photos ;

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final ValueNotifier<int> _currentSlideIndex = ValueNotifier(0) ;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 269.0, viewportFraction: 1, onPageChanged: (int sliderIndex, _){
            _currentSlideIndex.value = sliderIndex ;
          }),
          items: widget.photos.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: NetworkImage(i), fit: BoxFit.cover)
                    ),
                    child: widget.photos.isEmpty?Center(child: Text('No photos available', style: TextStyle(fontSize: 16.0),)) : null
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentSlideIndex,
            builder: (context,index, _){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<widget.photos.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 1.0, color: Colors.grey.shade300),
                            color: _currentSlideIndex.value==i ? AppColors.themeColor : Colors.white
                        ),
                      ),
                    )
                ],



              );
            },

          ),
        )
      ],
    );
  }
}
