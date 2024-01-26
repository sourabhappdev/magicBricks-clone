import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Constants/Constants.dart';
import '../Models/PropertyModel.dart';

class PropertyCard extends StatefulWidget {
  final PropertyModel property;
  PropertyCard({required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  int _myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return Image.network(
                  widget.property.imageUrl,
                  height: 250.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                height: 250,
                pageSnapping: true,
                viewportFraction: 1,
                autoPlayInterval: Duration(milliseconds: 1500),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.linear,
                // enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _myCurrentIndex = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Center(
            child: AnimatedSmoothIndicator(
                activeIndex: _myCurrentIndex,
                effect: const WormEffect(
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                  paintStyle: PaintingStyle.fill,
                  dotWidth: 8,
                  dotHeight: 8,
                  spacing: 10,
                ),
                count: 3),
          ),
          SizedBox(
            height: 4.0,
          ),
          // Property Details
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Property Name
                    Text(
                      widget.property.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Property Price
                    Column(
                      children: [
                        Text(
                          '\$${widget.property.price.toString()}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'onwards',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "2,3 BHK Flats",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),

                // Property Location
                Text(
                  widget.property.location,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Favorite Icon Button
          Padding(
            padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
