class CvProject {
  const CvProject({
    required this.name,
    required this.technology,
    required this.description,
    required this.features,
  });

  final String name;
  final String technology;
  final String description;
  final List<String> features;
}

class CvExperience {
  const CvExperience({
    required this.position,
    required this.company,
    required this.period,
    required this.description,
  });

  final String position;
  final String company;
  final String period;
  final String description;
}

class CvContent {
  static const name = 'Radovan Kljestan';
  static const title = 'Mobile & Web developer';
  static const email = 'kljestan.radovan@gmail.com';
  static const phone = '+381 64 075 99 40';
  static const github = 'github.com/Radovan92';
  static const location = 'Novi Sad, Serbia';

  static const profile =
      'Mobile & web developer with 5+ years of experience, working on cross-platform apps, web applications and Web3 projects.';

  static const skills = [
    'Flutter, React JS ',
    'Problem solving',
    'Git, Agile/Scrum',
  ];

  static const languages = ['English', 'Serbian'];

  static const experience = CvExperience(
    position: 'Mobile & Web Developer',
    company: 'NSWD, Novi Sad',
    period: 'June 2019 - Present',
    description:
        'Developing and maintaining mobile and web applications, including a Web3 project.',
  );

  static const projects = [
    CvProject(
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
    CvProject(
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
    CvProject(
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
    CvProject(
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
  ];
}
