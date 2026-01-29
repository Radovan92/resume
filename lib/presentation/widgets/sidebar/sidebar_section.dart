import 'package:flutter/material.dart';

class SidebarSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool isMobile;

  const SidebarSection({
    super.key,
    required this.title,
    required this.children,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: isMobile ? 10 : 12),
        ...children,
      ],
    );
  }
}
