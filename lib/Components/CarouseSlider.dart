import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';

class LoginPageSlider extends StatelessWidget {
  const LoginPageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: AppConstantsColor.darkTextColor,
                height: 250,
                width: 500,
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          height: 250,
          pageSnapping: true,
          viewportFraction: .80,
          autoPlayInterval: Duration(milliseconds: 1500),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
