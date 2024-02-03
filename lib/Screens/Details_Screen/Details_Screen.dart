import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Models/PropertyModel.dart';

class Details_Screen extends StatefulWidget {
  final PropertyModel property;
  const Details_Screen({super.key, required this.property});

  @override
  State<Details_Screen> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {
  int _myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.description),
                    SizedBox(height: 10),
                    Text(
                      'Location:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.location),
                    SizedBox(height: 10),
                    Text(
                      'City:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.city),
                    SizedBox(height: 10),
                    Text(
                      'Locality:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.locality),
                    SizedBox(height: 10),
                    Text(
                      'Address:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.address),
                    SizedBox(height: 10),
                    Text(
                      'Property Type:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.propertyForBuySell),
                    SizedBox(height: 10),
                    Text(
                      'Category:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.category),
                    SizedBox(height: 10),
                    Text(
                      'Sub-Category:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.property.subCategory),
                    SizedBox(height: 10),
                    Text(
                      'Carpet Area:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${widget.property.carpetArea} sq. ft.'),
                    SizedBox(height: 10),
                    Text(
                      'Super Area:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${widget.property.superArea} sq. ft.'),
                    SizedBox(height: 10),
                    Text(
                      'Number of BHK:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${widget.property.numberBHK} BHK'),
                    SizedBox(height: 10),
                    Text(
                      'Number of Washrooms:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${widget.property.numberWashroom}'),
                    SizedBox(height: 10),
                    Text(
                      'Number of Floors:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${widget.property.numberFloor}'),
                    SizedBox(height: 10),
                    Text(
                      'Price:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('\$${widget.property.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
