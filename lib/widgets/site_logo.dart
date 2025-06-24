import 'package:flutter/material.dart';


class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child:  Row(
        children: [
          Image.asset(height: 150,
            "assets/logo/logo.png",
          ),
          Text("Mosaic Company",style: TextStyle(

            fontSize: screenSize.width * 0.027,


          ),)
        ],
      ),
    );
  }
}
