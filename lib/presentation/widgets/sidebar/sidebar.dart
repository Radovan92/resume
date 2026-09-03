import 'package:flutter/material.dart';
import '../../../data/cv_content.dart';
import 'sidebar_section.dart';
import 'icon_text_row.dart';
import 'bullet_text.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: const Color(0xFF33373A),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 32,
        vertical: isMobile ? 24 : 40,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: isMobile ? 60 : 80,
                    backgroundImage: const AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  Text(
                    CvContent.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    CvContent.title,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: isMobile ? 24 : 40),
            SidebarSection(
              title: 'CONTACT',
              isMobile: isMobile,
              children: [
                IconTextRow(
                  icon: Icons.email,
                  text: CvContent.email,
                  isMobile: isMobile,
                ),
                IconTextRow(
                  icon: Icons.phone,
                  text: CvContent.phone,
                  isMobile: isMobile,
                ),
                IconTextRow(
                  icon: Icons.link,
                  text: CvContent.github,
                  isMobile: isMobile,
                ),
                IconTextRow(
                  icon: Icons.location_on,
                  text: CvContent.location,
                  isMobile: isMobile,
                ),
              ],
            ),
            SizedBox(height: isMobile ? 24 : 32),
            SidebarSection(
              title: 'SKILLS',
              isMobile: isMobile,
              children: [
                for (final skill in CvContent.skills)
                  BulletText(skill, isMobile: isMobile),
              ],
            ),
            SizedBox(height: isMobile ? 24 : 32),
            SidebarSection(
              title: 'LANGUAGES',
              isMobile: isMobile,
              children: [
                for (final language in CvContent.languages)
                  BulletText(language, isMobile: isMobile),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
