import 'package:flutter/material.dart';

class EducationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;

  const EducationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(subtitle),
        const SizedBox(height: 4),
        Text(period, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }
}
