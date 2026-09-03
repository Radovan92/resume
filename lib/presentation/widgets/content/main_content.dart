import 'package:flutter/material.dart';
import '../../../data/cv_content.dart';
import 'section_title.dart';
import 'experience_item.dart';
import 'project_item.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('PROFILE'),
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            CvContent.profile,
            style: TextStyle(fontSize: isMobile ? 13 : 14),
          ),
          SizedBox(height: isMobile ? 24 : 32),
          const SectionTitle('EXPERIENCE'),
          SizedBox(height: isMobile ? 12 : 16),
          ExperienceItem(
            position: CvContent.experience.position,
            company: CvContent.experience.company,
            period: CvContent.experience.period,
            description: CvContent.experience.description,
          ),
          SizedBox(height: isMobile ? 24 : 32),
          const SectionTitle('PROJECTS'),
          SizedBox(height: isMobile ? 12 : 16),
          for (var i = 0; i < CvContent.projects.length; i++) ...[
            if (i > 0) SizedBox(height: isMobile ? 12 : 16),
            ProjectItem(
              name: CvContent.projects[i].name,
              technology: CvContent.projects[i].technology,
              description: CvContent.projects[i].description,
              features: CvContent.projects[i].features,
            ),
          ],
        ],
      ),
    );
  }
}
