import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_colors.dart';



class ProductCarousel extends StatelessWidget {
  ProductCarousel({super.key});
  final ValueNotifier<int> _currentSlideIndex = ValueNotifier(0) ;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 269.0, viewportFraction: 1, onPageChanged: (int sliderIndex, _){
            _currentSlideIndex.value = sliderIndex ;
          }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text('text $i', style: TextStyle(fontSize: 16.0),))
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
                  for(int i=0;i<5; i++)
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
