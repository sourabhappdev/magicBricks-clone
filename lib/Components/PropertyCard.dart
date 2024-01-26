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
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      padding: EdgeInsets.only(top: 4, bottom: 4),
      color: Colors.white70,
      child: Card(
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
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return Image.network(
                        widget.property.imageUrl,
                        height: 200.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: false,
                      height: 200,
                      pageSnapping: true,
                      viewportFraction: 1,
                      // autoPlayInterval: Duration(milliseconds: 1500),
                      // autoPlayAnimationDuration: Duration(seconds: 1),
                      // autoPlayCurve: Curves.linear,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _myCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 8.0, // Adjust the position as needed
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _myCurrentIndex,
                        effect: const WormEffect(
                          activeDotColor: Colors.white,
                          dotColor: Colors.grey,
                          paintStyle: PaintingStyle.fill,
                          dotWidth: 8,
                          dotHeight: 8,
                          spacing: 10,
                        ),
                        count: 3,
                      ),
                    ),
                  ),
                ],
              ),
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
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppConstantsColor.materialButtonColor,
                      // elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Request Callback'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
