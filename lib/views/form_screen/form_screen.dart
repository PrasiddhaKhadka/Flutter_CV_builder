import 'package:cv_builder/provider/user_form_field_provider.dart';
import 'package:cv_builder/views/Preview_screen/preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV Builder'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<UserFormFieldProvider>().clearAll();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PersonalInfoSection(),
            SizedBox(height: 24),
            _SummarySection(),
            SizedBox(height: 24),
            _EducationSection(),
            SizedBox(height: 24),
            _ExperienceSection(),
            SizedBox(height: 24),
            _SkillsSection(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CVPreviewScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Preview CV', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}



class _PersonalInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Personal Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        _buildTextField(
          context,
          hint: 'Full Name',
          icon: Icons.person,
          onChanged: (value) => context.read<UserFormFieldProvider>().updateName(value),
        ),
        _buildTextField(
          context,
          hint: 'Email',
          icon: Icons.email,
          onChanged: (value) => context.read<UserFormFieldProvider>().updateEmail(value),
        ),
        _buildTextField(
          context,
          hint: 'Phone',
          icon: Icons.phone,
          onChanged: (value) => context.read<UserFormFieldProvider>().updatePhone(value),
        ),
        _buildTextField(
          context,
          hint: 'Address',
          icon: Icons.location_on,
          onChanged: (value) => context.read<UserFormFieldProvider>().updateAddress(value),
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context, {required String hint, required IconData icon, required Function(String) onChanged}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Professional Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        TextField(
          onChanged: (value) => context.read<UserFormFieldProvider>().updateSummary(value),
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Brief summary about yourself',
            prefixIcon: Icon(Icons.description),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}

class _EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserFormFieldProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Education', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () => provider.addEducation(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...List.generate(provider.educationList.length, (index) {
              return _EducationCard(index: index);
            }),
          ],
        );
      },
    );
  }
}

class _EducationCard extends StatelessWidget {
  final int index;

  _EducationCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Education ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
                if (context.watch<UserFormFieldProvider>().educationList.length > 1)
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => context.read<UserFormFieldProvider>().removeEducation(index),
                  ),
              ],
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateEducation(index, degree: value),
              decoration: InputDecoration(
                hintText: 'Degree (e.g., BS in Computer Science)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateEducation(index, institution: value),
              decoration: InputDecoration(
                hintText: 'Institution Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateEducation(index, year: value),
              decoration: InputDecoration(
                hintText: 'Year (e.g., 2020-2024)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserFormFieldProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Work Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () => provider.addExperience(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...List.generate(provider.experienceList.length, (index) {
              return _ExperienceCard(index: index);
            }),
          ],
        );
      },
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final int index;

  _ExperienceCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Experience ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
                if (context.watch<UserFormFieldProvider>().experienceList.length > 1)
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => context.read<UserFormFieldProvider>().removeExperience(index),
                  ),
              ],
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateExperience(index, position: value),
              decoration: InputDecoration(
                hintText: 'Position Title',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateExperience(index, company: value),
              decoration: InputDecoration(
                hintText: 'Company Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateExperience(index, duration: value),
              decoration: InputDecoration(
                hintText: 'Duration (e.g., Jan 2020 - Dec 2022)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) => context.read<UserFormFieldProvider>().updateExperience(index, description: value),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Job Description',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserFormFieldProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () => provider.addSkill(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...List.generate(provider.skillsList.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => provider.updateSkill(index, value),
                        decoration: InputDecoration(
                          hintText: 'Skill ${index + 1}',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    if (provider.skillsList.length > 1)
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => provider.removeSkill(index),
                      ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
