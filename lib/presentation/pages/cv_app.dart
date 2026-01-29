import 'package:flutter/material.dart';
import 'cv_page.dart';

class CvApp extends StatelessWidget {
  const CvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radovan Kljestan - CV',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14, height: 1.4),
        ),
      ),
      home: const CvPage(),
    );
  }
}
