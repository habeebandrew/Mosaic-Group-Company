import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';

class ImagePreviewScreen extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImagePreviewScreen({
    required this.images,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  late PageController _pageController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _goToNextImage() {
    if (_pageController.page != null &&
        _pageController.page!.toInt() < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousImage() {
    if (_pageController.page != null && _pageController.page!.toInt() > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.scaffoldBg,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: CustomColor.scaffoldBg,
      body: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: (event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey.keyLabel == 'Arrow Right') {
              _goToNextImage();
            } else if (event.logicalKey.keyLabel == 'Arrow Left') {
              _goToPreviousImage();
            }
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Center(
                  child: FutureBuilder(
                    future: precacheImage(
                      AssetImage(widget.images[index]),
                      context,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return InteractiveViewer(
                          child: Image.asset(
                            widget.images[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                );
              },
            ),
            // السهم الأيسر
            Positioned(
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: _goToPreviousImage,
              ),
            ),
            // السهم الأيمن
            Positioned(
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: _goToNextImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
