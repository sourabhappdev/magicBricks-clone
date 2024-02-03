import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Constants/Constants.dart';
import '../Models/PropertyModel.dart';
import 'package:magic_bricks/Screens/Details_Screen/Details_Screen.dart';
class SmallPropertyCard extends StatefulWidget {
  final PropertyModel property;
  const SmallPropertyCard({super.key, required this.property});

  @override
  State<SmallPropertyCard> createState() => _SmallPropertyCardState();
}

class _SmallPropertyCardState extends State<SmallPropertyCard> {
  int _myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  Details_Screen(property: widget.property),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SizedBox(
          height: 300,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                              width: double.infinity,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            height: 150,
                            pageSnapping: true,
                            viewportFraction: 1,
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
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Property Price
                            Column(
                              children: [
                                Text(
                                  '\$${widget.property.price.toString()}',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const Text(
                                  'onwards',
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                fontSize: 12.0,
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
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 4.0,
                            color: AppConstantsColor.materialButtonColor,
                            child: Container(
                              decoration: BoxDecoration(
                                // color: AppConstantsColor.materialButtonColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Request Callback",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            size: 22,
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
          ),
        ),
      ),
    );
  }
}
