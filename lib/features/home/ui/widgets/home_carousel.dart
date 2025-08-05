import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/features/home/data/model/home_carousel_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../product/data/model/product_category_model.dart';




class HomeCarousel extends StatefulWidget {
   HomeCarousel({super.key, required this.sliderItems});
  final List<HomeCarouselModel> sliderItems ;

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final ValueNotifier<int> _currentSlideIndex = ValueNotifier(0) ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 190.0, viewportFraction: 1, onPageChanged: (int sliderIndex, _){
            _currentSlideIndex.value = sliderIndex ;
          }),
          items: widget.sliderItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(item.photoUrl),
                            fit: BoxFit.cover
                        ),

                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text('', style: TextStyle(fontSize: 16.0),))
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _currentSlideIndex,
          builder: (context,index, _){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<widget.sliderItems.length; i++)
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

        )
      ],
    );
  }
}
