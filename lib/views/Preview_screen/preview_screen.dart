import 'package:cv_builder/app/const/templates_enum.dart';
import 'package:cv_builder/provider/templates_provider.dart';
import 'package:cv_builder/provider/user_form_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CVPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV Preview'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Share feature coming soon!')),
              );
            },
          ),
        ],
      ),
      // body: Consumer<UserFormFieldProvider>(
      //   builder: (context, provider, child) {
      //     return SingleChildScrollView(
      //       child: Container(
      //         padding: EdgeInsets.all(24),
      //         color: Colors.white,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             // Header
      //             Center(
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     provider.name.isEmpty ? 'Your Name' : provider.name,
      //                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      //                   ),
      //                   SizedBox(height: 8),
      //                   if (provider.email.isNotEmpty || provider.phone.isNotEmpty)
      //                     Text(
      //                       [provider.email, provider.phone].where((s) => s.isNotEmpty).join(' • '),
      //                       style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      //                     ),
      //                   if (provider.address.isNotEmpty)
      //                     Text(
      //                       provider.address,
      //                       style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      //                     ),
      //                 ],
      //               ),
      //             ),
                  
      //             if (provider.summary.isNotEmpty) ...[
      //               SizedBox(height: 24),
      //               Divider(),
      //               _buildSectionTitle('PROFESSIONAL SUMMARY'),
      //               Text(provider.summary, style: TextStyle(fontSize: 14, height: 1.5)),
      //             ],
                  
      //             if (provider.educationList.any((e) => e.degree.isNotEmpty)) ...[
      //               SizedBox(height: 24),
      //               Divider(),
      //               _buildSectionTitle('EDUCATION'),
      //               ...provider.educationList.where((e) => e.degree.isNotEmpty).map((edu) {
      //                 return Padding(
      //                   padding: EdgeInsets.only(bottom: 12),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(edu.degree, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      //                       if (edu.institution.isNotEmpty)
      //                         Text(edu.institution, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      //                       if (edu.year.isNotEmpty)
      //                         Text(edu.year, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
      //                     ],
      //                   ),
      //                 );
      //               }).toList(),
      //             ],
                  
      //             if (provider.experienceList.any((e) => e.position.isNotEmpty)) ...[
      //               SizedBox(height: 24),
      //               Divider(),
      //               _buildSectionTitle('WORK EXPERIENCE'),
      //               ...provider.experienceList.where((e) => e.position.isNotEmpty).map((exp) {
      //                 return Padding(
      //                   padding: EdgeInsets.only(bottom: 16),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(exp.position, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      //                       if (exp.company.isNotEmpty)
      //                         Text(exp.company, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      //                       if (exp.duration.isNotEmpty)
      //                         Text(exp.duration, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
      //                       if (exp.description.isNotEmpty)
      //                         Padding(
      //                           padding: EdgeInsets.only(top: 4),
      //                           child: Text(exp.description, style: TextStyle(fontSize: 14, height: 1.5)),
      //                         ),
      //                     ],
      //                   ),
      //                 );
      //               }).toList(),
      //             ],
                  
      //             if (provider.skillsList.any((s) => s.isNotEmpty)) ...[
      //               SizedBox(height: 24),
      //               Divider(),
      //               _buildSectionTitle('SKILLS'),
      //               Wrap(
      //                 spacing: 8,
      //                 runSpacing: 8,
      //                 children: provider.skillsList
      //                     .where((s) => s.isNotEmpty)
      //                     .map((skill) => Chip(
      //                           label: Text(skill),
      //                           backgroundColor: Colors.blue[50],
      //                         ))
      //                     .toList(),
      //               ),
      //             ],
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
      body: Column(
        children: [
          // Fixed CV Preview (non-scrollable)
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Consumer2<UserFormFieldProvider,TemplatesProvider>(
                builder: (context, userFFProvider, templateProvider ,child) {
                  return _buildTemplate(userFFProvider,templateProvider);
                },
              ),
            ),
          ),
          
          // Template Selector (scrollable)
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Choose Template',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: _TemplateSelector(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue[700],
        ),
      ),
    );
  }

Widget _buildTemplate(UserFormFieldProvider userFFProvider,TemplatesProvider templateProvider) {
    switch (templateProvider.selectedTemplate) {
      case CVTemplate.classic:
        return ClassicTemplate(provider: userFFProvider);
      case CVTemplate.modern:
        return ModernTemplate(provider: userFFProvider);
      case CVTemplate.minimal:
        return ClassicTemplate(provider: userFFProvider);
      case CVTemplate.creative:
        return ClassicTemplate(provider: userFFProvider);
    }
  }
  
}



class _TemplateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TemplatesProvider>(
      builder: (context, provider, child) {
        return ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            _TemplateCard(
              title: 'Classic',
              template: CVTemplate.classic,
              color: Colors.blue[100]!,
              isSelected: provider.selectedTemplate == CVTemplate.classic,
            ),
            _TemplateCard(
              title: 'Modern',
              template: CVTemplate.modern,
              color: Colors.purple[100]!,
              isSelected: provider.selectedTemplate == CVTemplate.modern,
            ),
            // _TemplateCard(
            //   title: 'Minimal',
            //   template: CVTemplate.minimal,
            //   color: Colors.grey[300]!,
            //   isSelected: provider.selectedTemplate == CVTemplate.minimal,
            // ),
            // _TemplateCard(
            //   title: 'Creative',
            //   template: CVTemplate.creative,
            //   color: Colors.orange[100]!,
            //   isSelected: provider.selectedTemplate == CVTemplate.creative,
            // ),
          ],
        );
      },
    );
  }
}

class _TemplateCard extends StatelessWidget {
  final String title;
  final CVTemplate template;
  final Color color;
  final bool isSelected;

  _TemplateCard({
    required this.title,
    required this.template,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TemplatesProvider>().updateTemplate(template);
      },
      child: Container(
        width: 120,
        margin: EdgeInsets.only(right: 12, bottom: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.description,
              size: 40,
              color: isSelected ? Colors.blue : Colors.grey[700],
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// TEMPLATES
// ============================================

// Classic Template
class ClassicTemplate extends StatelessWidget {
  final UserFormFieldProvider provider;

  ClassicTemplate({required this.provider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    provider.name.isEmpty ? 'Your Name' : provider.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    [provider.email, provider.phone].where((s) => s.isNotEmpty).join(' | '),
                    style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                  ),
                  if (provider.address.isNotEmpty)
                    Text(provider.address, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                ],
              ),
            ),
            if (provider.summary.isNotEmpty) ...[
              SizedBox(height: 12),
              Divider(),
              _buildClassicSection('SUMMARY', provider.summary),
            ],
            if (provider.educationList.any((e) => e.degree.isNotEmpty)) ...[
              SizedBox(height: 12),
              Divider(),
              Text('EDUCATION', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              ...provider.educationList.where((e) => e.degree.isNotEmpty).map((edu) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(edu.degree, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      if (edu.institution.isNotEmpty)
                        Text(edu.institution, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                      if (edu.year.isNotEmpty)
                        Text(edu.year, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                    ],
                  ),
                );
              }),
            ],
            if (provider.experienceList.any((e) => e.position.isNotEmpty)) ...[
              SizedBox(height: 12),
              Divider(),
              Text('EXPERIENCE', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              ...provider.experienceList.where((e) => e.position.isNotEmpty).map((exp) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exp.position, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      if (exp.company.isNotEmpty)
                        Text(exp.company, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                      if (exp.duration.isNotEmpty)
                        Text(exp.duration, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                      if (exp.description.isNotEmpty)
                        Text(exp.description, style: TextStyle(fontSize: 11)),
                    ],
                  ),
                );
              }),
            ],
            if (provider.skillsList.any((s) => s.isNotEmpty)) ...[
              SizedBox(height: 12),
              Divider(),
              Text('SKILLS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text(
                provider.skillsList.where((s) => s.isNotEmpty).join(' • '),
                style: TextStyle(fontSize: 11),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildClassicSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Text(content, style: TextStyle(fontSize: 11)),
      ],
    );
  }
}

// Modern Template
class ModernTemplate extends StatelessWidget {
  final UserFormFieldProvider provider;

  ModernTemplate({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar
        Container(
          width: 120,
          color: Colors.purple[700],
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    provider.name.isNotEmpty ? provider.name[0].toUpperCase() : '?',
                    style: TextStyle(fontSize: 28, color: Colors.purple[700]),
                  ),
                ),
                SizedBox(height: 12),
                if (provider.email.isNotEmpty) ...[
                  Text('CONTACT', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  Text(provider.email, style: TextStyle(fontSize: 8, color: Colors.white70)),
                  if (provider.phone.isNotEmpty)
                    Text(provider.phone, style: TextStyle(fontSize: 8, color: Colors.white70)),
                  SizedBox(height: 12),
                ],
                if (provider.skillsList.any((s) => s.isNotEmpty)) ...[
                  Text('SKILLS', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  ...provider.skillsList.where((s) => s.isNotEmpty).map((skill) => Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text('• $skill', style: TextStyle(fontSize: 8, color: Colors.white70)),
                  )),
                ],
              ],
            ),
          ),
        ),
        
        // Main Content
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.name.isEmpty ? 'Your Name' : provider.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple[700]),
                ),
                SizedBox(height: 8),
                if (provider.summary.isNotEmpty) ...[
                  Text(provider.summary, style: TextStyle(fontSize: 10)),
                  SizedBox(height: 12),
                ],
                if (provider.experienceList.any((e) => e.position.isNotEmpty)) ...[
                  Text('EXPERIENCE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.purple[700])),
                  SizedBox(height: 6),
                  ...provider.experienceList.where((e) => e.position.isNotEmpty).map((exp) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(exp.position, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                          if (exp.company.isNotEmpty)
                            Text(exp.company, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                          if (exp.description.isNotEmpty)
                            Text(exp.description, style: TextStyle(fontSize: 9)),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 12),
                ],
                if (provider.educationList.any((e) => e.degree.isNotEmpty)) ...[
                  Text('EDUCATION', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.purple[700])),
                  SizedBox(height: 6),
                  ...provider.educationList.where((e) => e.degree.isNotEmpty).map((edu) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(edu.degree, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                          if (edu.institution.isNotEmpty)
                            Text(edu.institution, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                        ],
                      ),
                    );
                  }),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
