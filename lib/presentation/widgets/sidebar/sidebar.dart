import 'package:flutter/material.dart';
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
                    'Radovan Kljestan',
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
                    'Mobile & Web developer',
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
                  text: 'kljestan.radovan@gmail.com',
                  isMobile: isMobile,
                ),
                IconTextRow(
                  icon: Icons.phone,
                  text: '+381 64 075 99 40',
                  isMobile: isMobile,
                ),
                IconTextRow(
                  icon: Icons.link,
                  text: 'github.com/Radovan92',
                  isMobile: isMobile,
                ),
                IconTextRow(
                  icon: Icons.location_on,
                  text: 'Novi Sad, Serbia',
                  isMobile: isMobile,
                ),
              ],
            ),
            SizedBox(height: isMobile ? 24 : 32),
            SidebarSection(
              title: 'SKILLS',
              isMobile: isMobile,
              children: [
                BulletText('Flutter, React JS ', isMobile: isMobile),
                BulletText('Problem solving', isMobile: isMobile),
                BulletText('Git, Agile/Scrum', isMobile: isMobile),
              ],
            ),
            SizedBox(height: isMobile ? 24 : 32),
            SidebarSection(
              title: 'LANGUAGES',
              isMobile: isMobile,
              children: [
                BulletText('English', isMobile: isMobile),
                BulletText('Serbian', isMobile: isMobile),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
