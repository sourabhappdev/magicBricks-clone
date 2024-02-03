import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Models/PropertyModel.dart';

class ListedPropertyCard extends StatefulWidget {
  final PropertyModel property;
  const ListedPropertyCard({super.key, required this.property});

  @override
  State<ListedPropertyCard> createState() => _ListedPropertyCardState();
}

class _ListedPropertyCardState extends State<ListedPropertyCard> {
  int _myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      color: Colors.white70,
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
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
              padding: const EdgeInsets.all(8.0),
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
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Property Price
                      Column(
                        children: [
                          Text(
                            '\$${widget.property.price.toString()}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const Text(
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
                  const Row(
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
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Favorite Icon Button
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black87,
                      size: 24,
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
