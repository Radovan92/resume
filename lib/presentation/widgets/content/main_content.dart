import 'package:flutter/material.dart';
import 'section_title.dart';
import 'experience_item.dart';
import 'project_item.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle('PROFILE'),
          SizedBox(height: 8),
          Text(
            'Mobile & web developer with 5+ years of experience, working on cross-platform apps, web applications and Web3 projects.',
          ),
          SizedBox(height: 32),

          SectionTitle('EXPERIENCE'),
          SizedBox(height: 16),
          ExperienceItem(
            position: 'Mobile & Web Developer / Frontend Team Lead',
            company: 'NSWD, Novi Sad',
            period: 'June 2019 - Present',
            description:
                'Developing and maintaining mobile and web applications, including a Web3 project.',
            projects: ['Behavior Flow (Swift)'],
          ),
          SizedBox(height: 32),
          SectionTitle('PROJECTS'),
          SizedBox(height: 16),
          ProjectItem(
            name: 'Reenact',
            technology: 'Flutter (Android)',
            description:
                'A groundbreaking startup with a fully automated AI system that enables machines to interpret human acting skills.',
            features: [
              'Android application developed using the first stable version of Flutter',
              'Audio and video recording, camera integration',
              'Data visualization through charts',
              'AWS infrastructure for secure video storage and backend services',
            ],
          ),
          SizedBox(height: 16),
          ProjectItem(
            name: 'InfoZgrada',
            technology: 'Flutter (iOS & Android)',
            description:
                'A free application that enables easy and efficient communication between property managers, residents, and service companies.',
            features: [
              'Cross-platform app for residential community management',
              'HTTP communication, state management (Provider → BLoC)',
              'Push notifications and in-app chat',
              'Available on Google Play and App Store',
            ],
          ),
          SizedBox(height: 16),
          ProjectItem(
            name: 'CeDeFiAi',
            technology: 'React Web3 (Web)',
            description:
                'The ultimate non-custodial CeFi & DeFi hub for all and every need, allowing users to trade, invest, learn, complete tasks, and get rewards.',
            features: [
              'Large-scale frontend application in Web3',
              'Developed using Agile methodologies with daily stand-ups',
              'Jira task management, task creation, code reviews',
              'Frontend architecture discussions',
            ],
          ),
          SizedBox(height: 16),
          ProjectItem(
            name: 'Cinteraction',
            technology: 'Flutter (Web)',
            description:
                'Virtual Conferencing of the Future (VCF), an intelligent AI-enabled video-conferencing solution.',
            features: [
              'Real-time communication and participant attention tracking',
              'BLoC state management, API layer',
              'Janus WebRTC integration for chat and stream',
              'Flutter Clean Architecture',
              'Live web link: cinteraction.com',
              'Android & iOS versions planned',
            ],
          ),
        ],
      ),
    );
  }
}
