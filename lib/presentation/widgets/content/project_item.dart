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
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$name - $technology',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 13 : 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: isMobile ? 13 : 14),
        ),
        if (features != null && features!.isNotEmpty) ...[
          const SizedBox(height: 4),
          for (final feature in features!)
            Padding(
              padding: EdgeInsets.only(
                left: isMobile ? 12 : 16,
                top: 2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(fontSize: isMobile ? 13 : 14)),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(fontSize: isMobile ? 13 : 14),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
