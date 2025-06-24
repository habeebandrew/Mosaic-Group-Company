import 'dart:js' as js;
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      color: CustomColor.scaffoldBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الصورة والنص الرئيسي
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo/logo.png",
                          height: screenWidth > 600 ? 120 : 100,
                        ),
                        SizedBox(width: screenWidth > 600 ? 20 : 10),
                        Flexible(
                          child: Text(
                            "Mosaic Group Company",
                            style: TextStyle(
                              fontSize: screenWidth > 600 ? 24 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 20), // مسافة بين العناصر
                    // النصوص الإضافية
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Eng. Elias Fayad",
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 18 : 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          " & ",
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 18 : 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "GD. Jan Karraz",
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 18 : 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          // Divider
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 25),
          // Title
          const Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Divider
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 25),

          // Contact Details Section (Responsive using Wrap)
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              ContactItem(
                icon: Icons.phone,
                onTap: () {
                  js.context.callMethod('open', ['tel:+963 932 684 108']);
                },
              ),
              ContactItem(
                icon: Icons.email,
                onTap: () {
                  js.context.callMethod(
                      'open', ['mailto:eliasandrehfayad@gmail.com']);
                },
              ),
              SocialIcon(
                assetPath: "assets/instagram.png",
                onTap: () {
                  js.context.callMethod('open', [
                    'https://www.instagram.com/mosaic_grop/?igsh=MnVxMGc2cG1kMmVp'
                  ]);
                },
              ),
              SocialIcon(
                assetPath: "assets/telegram.png",
                onTap: () {
                  js.context
                      .callMethod('open', ['http://t.me/eliasandrehfayaf']);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget for Contact Item
class ContactItem extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            final scale = isHovered ? 1.2 : _scaleAnimation.value;
            return Transform.scale(
              scale: scale,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget for Social Media Icon
class SocialIcon extends StatefulWidget {
  final String assetPath;
  final VoidCallback onTap;

  const SocialIcon({
    super.key,
    required this.assetPath,
    required this.onTap,
  });

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            final scale = isHovered ? 1.2 : _scaleAnimation.value;
            return Transform.scale(
              scale: scale,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.assetPath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
