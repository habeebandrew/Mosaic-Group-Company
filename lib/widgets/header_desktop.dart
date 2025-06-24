import 'package:flutter/material.dart';
import 'package:mosaic_group_company/widgets/site_logo.dart';
import '../constants/colors.dart';
import '../constants/nav_items.dart';
import '../styles/style.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });

  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.infinity,
      decoration: kHederDecoration,
      child: Row(
        children: [
          // Logo
          SiteLogo(
            onTap: () {},
          ),
          // const SizedBox(width: 20),
          Spacer(),
          // Scrollable navigation bar
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < navTitles.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextButton(
                        onPressed: () {
                          onNavMenuTap(i);
                        },
                        child: Text(
                          navTitles[i],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
