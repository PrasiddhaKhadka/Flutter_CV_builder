import 'package:flutter/material.dart';

class TemplateScreen extends StatelessWidget {
  final String userName;
  List<UserExperienceModel> userExperience = [];

  TemplateScreen({
    super.key,
    required this.userName,
    required this.userExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 800,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xFF2E3A59),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        // backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      const SizedBox(height: 16),
                      // Name
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Title
                      const Text(
                        'Flutter Developer',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      // Contact Info
                      const Text(
                        'Contact',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Email: example@example.com\nPhone: +1234567890\nLocation: Pokhara, Nepal',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 24),
                      // Working Experience
                      const Text(
                        'Working Experience',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: userExperience.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                userExperience[index].title.toString(),
                              ),
                              subtitle: Text(
                                userExperience[index].description.toString(),
                              ),
                            );
                          },
                        ),
                      ),

                      // const Text(
                      //   '• Dart\n• Flutter\n• Firebase\n• REST APIs\n• Git',
                      //   style: TextStyle(color: Colors.white70, fontSize: 14),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                // Main Content
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       // Summary
                //       const Text(
                //         'Professional Summary',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       const SizedBox(height: 8),
                //       const Text(
                //         'Experienced Flutter Developer with a passion for creating beautiful and functional mobile applications. Skilled in Dart, Firebase, and responsive design.',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //       const SizedBox(height: 24),
                //       // Experience
                //       const Text(
                //         'Experience',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       const SizedBox(height: 8),
                //       experienceItem(
                //         title: 'Senior Flutter Developer',
                //         company: 'Tech Solutions Ltd.',
                //         duration: 'Jan 2020 - Present',
                //         description:
                //             'Lead the development of cross-platform mobile applications, collaborating with UI/UX designers and backend developers to deliver high-quality products.',
                //       ),
                //       const SizedBox(height: 16),
                //       experienceItem(
                //         title: 'Flutter Developer',
                //         company: 'Innovatech Pvt. Ltd.',
                //         duration: 'Jun 2018 - Dec 2019',
                //         description:
                //             'Developed and maintained mobile applications, implemented new features, and optimized performance for better user experience.',
                //       ),
                //       const SizedBox(height: 24),
                //       // Education
                //       const Text(
                //         'Education',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       const SizedBox(height: 8),
                //       educationItem(
                //         degree: 'Bachelor of Computer Science',
                //         institution: 'Pokhara University',
                //         year: '2014 - 2018',
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget experienceItem({
    required String title,
    required String company,
    required String duration,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title at $company',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          duration,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(description, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget educationItem({
    required String degree,
    required String institution,
    required String year,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          degree,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          institution,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Text(year, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

class UserExperienceModel {
  final String title;
  final String company;
  final String duration;
  final String description;
  UserExperienceModel({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });
}
