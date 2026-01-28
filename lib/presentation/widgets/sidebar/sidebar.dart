import 'package:flutter/material.dart';
import 'sidebar_section.dart';
import 'icon_text_row.dart';
import 'bullet_text.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF33373A),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Radovan Kljestan',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mobile & Web developer',
                    style: TextStyle(color: Colors.grey[300], fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const SidebarSection(
              title: 'CONTACT',
              children: [
                IconTextRow(
                  icon: Icons.email,
                  text: 'kljestan.radovan@gmail.com',
                ),
                IconTextRow(icon: Icons.phone, text: '+381 64 075 99 40'),
                IconTextRow(icon: Icons.link, text: 'github.com/Radovan92'),
                IconTextRow(icon: Icons.location_on, text: 'Novi Sad, Serbia'),
              ],
            ),
            const SizedBox(height: 32),
            const SidebarSection(
              title: 'SKILLS',
              children: [
                BulletText('Flutter, React JS '),
                BulletText('Problem solving'),
                BulletText('Git, Agile/Scrum'),
              ],
            ),
            const SizedBox(height: 32),
            const SidebarSection(
              title: 'LANGUAGES',
              children: [BulletText('English'), BulletText('Serbian')],
            ),
          ],
        ),
      ),
    );
  }
}
