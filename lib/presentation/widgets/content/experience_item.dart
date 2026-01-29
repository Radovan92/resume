import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final String position;
  final String company;
  final String period;
  final String description;
  final List<String> projects;

  const ExperienceItem({
    super.key,
    required this.position,
    required this.company,
    required this.period,
    required this.description,
    this.projects = const [],
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$position | $company',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 13 : 14,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          period,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: isMobile ? 11 : 12,
          ),
        ),
        SizedBox(height: isMobile ? 6 : 8),
        Text(description, style: TextStyle(fontSize: isMobile ? 13 : 14)),
        if (projects.isNotEmpty) ...[
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            'Projects:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 13 : 14,
            ),
          ),
          const SizedBox(height: 4),
          for (final project in projects)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: TextStyle(fontSize: isMobile ? 13 : 14)),
                Expanded(
                  child: Text(
                    project,
                    style: TextStyle(fontSize: isMobile ? 13 : 14),
                  ),
                ),
              ],
            ),
        ],
      ],
    );
  }
}
