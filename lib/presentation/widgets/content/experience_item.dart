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
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$position | $company',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(period, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        const SizedBox(height: 8),
        Text(description),
        if (projects.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Projects:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          for (final project in projects)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const Text('• '), Expanded(child: Text(project))],
            ),
        ],
      ],
    );
  }
}
