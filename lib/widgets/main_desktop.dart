import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainDesktop extends StatefulWidget {
  final GlobalKey sectionThreeKey;
  final GlobalKey sectionTwoKey;

  const MainDesktop({super.key, required this.sectionThreeKey, required this.sectionTwoKey});

  @override
  _MainDesktopState createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final List<String> images = [
      'assets/basic/11.jpg',
      'assets/basic/555.jpg',
      'assets/land/2.jpg',
      'assets/land/1.jpg',
    ];

    final List<Map<String, double>> imageSizes = [
      {'width': 600, 'height': 720},
      {'width': 400, 'height': 720},
      {'width': 1280, 'height': 720},
      {'width': 1280, 'height': 720},
    ];

    final List<Map<String, String>> captions = [
      {'main': "INTERIOR", 'sub': "DESIGN"},
      {'main': "PAINT", 'sub': "DESIGN"},
      {'main': "LANDSCAPING", 'sub': "DESIGN"},
      {'main': "LANDSCAPING", 'sub': "DESIGN"},
    ];

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: screenSize.height / 1.1,
        constraints: const BoxConstraints(minHeight: 350.0),
        child: Stack(
          children: [
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: screenSize.height / 1.2,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.easeInOut,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: images.asMap().entries.map((entry) {
                int index = entry.key;
                String image = entry.value;
                double imageWidth = imageSizes[index]['width']!;
                double imageHeight = imageSizes[index]['height']!;

                return Builder(
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          image,
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.cover,
                          // تحسين الأداء
                          cacheWidth: imageWidth.toInt(),
                          cacheHeight: imageHeight.toInt(),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            // النصوص والأزرار فوق الصور
            Positioned(
              left: 40,
              bottom: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        captions[currentIndex]['main']!,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        captions[currentIndex]['sub']!,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Scrollable.ensureVisible(
                            widget.sectionThreeKey.currentContext!,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        ),
                        child: Text(
                          "OUR SERVICE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.01,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          Scrollable.ensureVisible(
                            widget.sectionTwoKey.currentContext!,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        ),
                        child: Text(
                          "GET A QUOTE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.01,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
