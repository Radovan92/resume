import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final String name;
  final String technology;
  final String description;
  final List<String>? features;

  const ProjectItem({
    super.key,
    required this.name,
    required this.technology,
    required this.description,
    this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$name - $technology',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(description),
        if (features != null && features!.isNotEmpty) ...[
          const SizedBox(height: 4),
          for (final feature in features!)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• '),
                  Expanded(child: Text(feature)),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
