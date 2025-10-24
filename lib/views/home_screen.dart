import 'package:flutter/material.dart';

class CVBuilderHome extends StatefulWidget {
  @override
  State<CVBuilderHome> createState() => _CVBuilderHomeState();
}

class _CVBuilderHomeState extends State<CVBuilderHome> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _summaryController = TextEditingController();
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _summaryController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV Builder'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(_nameController, 'Full Name', Icons.person),
              _buildTextField(_emailController, 'Email', Icons.email),
              _buildTextField(_phoneController, 'Phone', Icons.phone),
              _buildTextField(_addressController, 'Address', Icons.location_on),
              
              SizedBox(height: 24),
              Text(
                'Professional Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(_summaryController, 'Brief summary about yourself', 
                  Icons.description, maxLines: 3),
              
              SizedBox(height: 24),
              Text(
                'Education',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(_educationController, 'e.g., BS in Computer Science, XYZ University (2020-2024)', 
                  Icons.school, maxLines: 3),
              
              SizedBox(height: 24),
              Text(
                'Work Experience',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(_experienceController, 'List your work experience', 
                  Icons.work, maxLines: 4),
              
              SizedBox(height: 24),
              Text(
                'Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(_skillsController, 'e.g., Flutter, Dart, Python, Communication', 
                  Icons.stars, maxLines: 2),
              
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _showPreview,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Preview CV', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _showPreview() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CVPreviewPage(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          address: _addressController.text,
          summary: _summaryController.text,
          education: _educationController.text,
          experience: _experienceController.text,
          skills: _skillsController.text,
        ),
      ),
    );
  }
}

class CVPreviewPage extends StatelessWidget {
  final String name, email, phone, address, summary, education, experience, skills;

  CVPreviewPage({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.summary,
    required this.education,
    required this.experience,
    required this.skills,
  });

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Column(
                  children: [
                    Text(
                      name.isEmpty ? 'Your Name' : name,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    if (email.isNotEmpty || phone.isNotEmpty)
                      Text(
                        [email, phone].where((s) => s.isNotEmpty).join(' • '),
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    if (address.isNotEmpty)
                      Text(
                        address,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                  ],
                ),
              ),
              
              if (summary.isNotEmpty) ...[
                SizedBox(height: 24),
                Divider(),
                _buildSection('PROFESSIONAL SUMMARY', summary),
              ],
              
              if (education.isNotEmpty) ...[
                SizedBox(height: 16),
                Divider(),
                _buildSection('EDUCATION', education),
              ],
              
              if (experience.isNotEmpty) ...[
                SizedBox(height: 16),
                Divider(),
                _buildSection('WORK EXPERIENCE', experience),
              ],
              
              if (skills.isNotEmpty) ...[
                SizedBox(height: 16),
                Divider(),
                _buildSection('SKILLS', skills),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }
}
