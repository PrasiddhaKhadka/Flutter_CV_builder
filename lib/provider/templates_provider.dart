import 'package:cv_builder/app/const/templates_enum.dart';
import 'package:flutter/material.dart';

class TemplatesProvider extends ChangeNotifier {
  // Template selection
  CVTemplate selectedTemplate = CVTemplate.classic;

  // Update template
  void updateTemplate(CVTemplate template) {
    selectedTemplate = template;
    notifyListeners();
  }

}