
import 'package:flutter/material.dart';
import 'package:mosaic_group_company/pages/home_page.dart';
import 'package:mosaic_group_company/styles/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kCustomTheme,
      title: 'mosaic group company',
      home: const HomePage(),
    );
  }
}
