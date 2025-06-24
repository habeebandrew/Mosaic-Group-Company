import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../pages/ImagePreviewScreen.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sections = [
      {
        "title": "GRAPHIC DESIGN",
        "description": "Enjoy a one-of-a-kind creative experience with our graphic design services! We transform ideas into inspiring designs that uniquely reflect your brand identity.",
        "images": [
          'assets/graphic/1.jpg',
          'assets/graphic/2.jpg',
          'assets/graphic/3.jpg',
          'assets/graphic/4.jpg',
          'assets/graphic/5.jpg',
          'assets/graphic/6.jpg',
          'assets/graphic/7.jpg',
          'assets/graphic/8.jpg',
          'assets/graphic/9.jpg',
          'assets/graphic/10.jpg',
          'assets/graphic/11.jpg',
          'assets/graphic/12.jpg',
        ],
      },
      {
        "title": "Interior Decorations",
        "description": "1. Interior and exterior design service\n2. Gypsum design and installation\n3. Painting and decoration design and installation\n4. Design brushes according to appropriate places",
        "images": [
          'assets/inter/1.jpg',
          'assets/inter/2.jpg',
          'assets/inter/3.jpg',
          'assets/inter/4.jpg',
          'assets/inter/5.jpg',
          'assets/inter/6.jpg',
          'assets/inter/7.jpg',
          'assets/inter/10.jpg',
          'assets/inter/13.jpg',
          'assets/inter/14.jpg',
        ],
      },
      {
        "title": "Paint",
        "description": "1. Interior and exterior design service\n2. Gypsum design and installation\n3. Painting and decoration design and installation\n4. Design brushes according to appropriate places",
        "images": [
          'assets/paint/1.jpg',
          'assets/paint/2.jpg',
          'assets/paint/3.jpg',
          'assets/paint/4.jpg',
        ],
      },
      {
        "title": "Landscaping DESIGN",
        "description": "Designing green spaces for homes, restaurants, resorts, and villas\n  \n",
        "images": [
          'assets/land/1.jpg',
          'assets/land/2.jpg',
          'assets/land/3.jpg',
          'assets/land/4.jpg',
          'assets/land/5.jpg',
          'assets/land/6.jpg',
          'assets/land/7.jpg',
          'assets/land/8.jpg',
          'assets/land/9.jpg',
          'assets/land/10.jpg',
          'assets/land/11.jpg',
          'assets/land/12.jpg',
          'assets/land/13.jpg',
        ],
      },
      {
        "title": "Gypsum Board DESIGN",
        "description": "1. Interior and exterior design service\n2. Gypsum design and installation\n3. Painting and decoration design and installation\n4. Design brushes according to appropriate places",
        "images": [
          'assets/gbs/1.jpg',
          'assets/gbs/2.jpg',
          'assets/gbs/3.jpg',
          'assets/gbs/4.jpg',
        ],
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1350) crossAxisCount = 4;
        else if (constraints.maxWidth > 1200) crossAxisCount = 3;
        else if (constraints.maxWidth > 700) crossAxisCount = 2;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Our Services",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  return ServiceCard(
                    title: section["title"]!,
                    description: section["description"]!,
                    images: section["images"]!,
                    color: Colors.amber,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> images;
  final Color color;

  const ServiceCard({
    required this.title,
    required this.description,
    required this.images,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  int _currentImageIndex = 0;
  bool isHovered = false;
  late PageController _pageController;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _stopAutoScroll();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentImageIndex < widget.images.length - 1) {
        _currentImageIndex++;
      } else {
        _currentImageIndex = 0;
      }
      _pageController.animateToPage(
        _currentImageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _stopAutoScroll();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _startAutoScroll();
      },
      child: GestureDetector(
        onTap: () {
          if (widget.images.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePreviewScreen(
                  images: widget.images,
                  initialIndex: _currentImageIndex,
                ),
              ),
            );
          }
        },
        child: AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: CustomColor.scaffoldBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: widget.color,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.images.isNotEmpty)
                  Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.images.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Image.asset(
                              widget.images[index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Scroll bar to indicate current image
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.images.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentImageIndex == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentImageIndex == index
                                  ? widget.color
                                  : Colors.white30,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// class ImagePreviewScreen extends StatelessWidget {
//   final List<String> images;
//   final int initialIndex;
//
//   const ImagePreviewScreen({
//     required this.images,
//     required this.initialIndex,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:CustomColor.scaffoldBg,
//       appBar: AppBar(
//         backgroundColor:CustomColor.scaffoldBg,
//         title: const Text('Image Preview'),
//       ),
//       body: PageView.builder(
//         itemCount: images.length,
//         controller: PageController(initialPage: initialIndex),
//         itemBuilder: (context, index) {
//           return Center(
//             child: Image.asset(
//               images[index],
//               fit: BoxFit.contain,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
