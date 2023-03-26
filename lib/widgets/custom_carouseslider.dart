import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List colorList = ['Red', 'Green ', 'Black', 'Yellow'];
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        viewportFraction: 1,
      ),
      items: colorList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '$i',
                style: const TextStyle(fontSize: 16.0),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
