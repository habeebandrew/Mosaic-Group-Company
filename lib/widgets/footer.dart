import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth > 600 ? 16 : 12;

          return RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Made by ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey[300],
                fontSize: fontSize,
              ),
              children: [
                TextSpan(
                  text: "Habeeb Andrew",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: fontSize,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      js.context.callMethod(
                          'open', ['https://www.linkedin.com/in/habeeb-andrew-6960a8296?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app']);

                    },
                ),
                TextSpan(
                  text: " | ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[300],
                    fontSize: fontSize,
                  ),
                ),
                TextSpan(
                  text: "WhatsApp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: fontSize,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      js.context.callMethod(
                          'open', ['https://wa.me/+963992093648']);

                    },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
