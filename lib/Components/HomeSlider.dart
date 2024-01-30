import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomeCarouselSlider extends StatelessWidget {
  final List<String> offers = [
    'Offer 1',
    'Offer 2',
    'Offer 3',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: offers.map((offer) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  offer,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}





