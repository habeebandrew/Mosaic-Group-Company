import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainMobile extends StatefulWidget {
  final GlobalKey sectionThreeKey;
  final GlobalKey sectionTwoKey;

  const MainMobile({super.key,required this.sectionTwoKey, required this.sectionThreeKey});

  @override
  _MainMobileState createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  int currentIndex = 0; // مؤشر لتتبع الصورة الحالية

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // قائمة الصور
    final List<String> images = [
      'assets/basic/11.jpg',
      'assets/basic/555.jpg',
      'assets/land/2.jpg',
      'assets/land/1.jpg',
    ];
    // النصوص لكل صورة
    final List<Map<String, String>> captions = [
      {'main': "INTERIOR", 'sub': "DESIGN"},
      {'main': "PAINT", 'sub': "DESIGN"},
      {'main': "LANDSCAPING", 'sub': "DESIGN"},
      {'main': "LANDSCAPING", 'sub': "DESIGN"},
    ];

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        height: screenSize.height/1.2,
        constraints: const BoxConstraints(minHeight: 560.0),
        child: Stack(
          children: [
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: screenSize.height,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.easeInOut,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index; // تحديث المؤشر بناءً على الصورة الحالية
                  });
                },
              ),
              items: images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // إضافة زوايا مستديرة
                      child: AspectRatio(
                        aspectRatio: 16 / 9, // التحكم في نسبة العرض إلى الطول
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover, // تغيير طريقة ملء الصورة
                          width: double.infinity,
                          height: double.infinity,
                          // تحسين الأداء
                          cacheWidth: (MediaQuery.of(context).size.width * 2).toInt(),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),

            ),
            // النصوص والأزرار فوق الصور
            Positioned(
              left: 20,
              bottom: 80,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        captions[currentIndex]['main']!,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05, // تحسين حجم النص
                          fontWeight: FontWeight.bold,
                          color: Colors.amber, // لون النص الرئيسي
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        captions[currentIndex]['sub']!,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05, // تحسين حجم النص
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // لون النص الثانوي
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {  Scrollable.ensureVisible(
                          widget.sectionThreeKey.currentContext!,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child:  Text(
                          "OUR SERVICE",
                          style: TextStyle(

                              fontSize: screenSize.width * 0.02, // تحسين حجم النص
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {  Scrollable.ensureVisible(
                          widget.sectionTwoKey.currentContext!,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child:  Text(
                          "GET A QUOTE",
                          style: TextStyle(                              fontSize: screenSize.width * 0.02, // تحسين حجم النص
                              color: Colors.white),
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
