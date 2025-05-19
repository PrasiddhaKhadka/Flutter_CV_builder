import 'package:cv_builder/views/template_screen.dart';
import 'package:flutter/cupertino.dart';

class UserFormFieldProvider with ChangeNotifier {
  final List<UserExperienceModel> _userExperience = [];

  List<UserExperienceModel> get userExperience => _userExperience;

  void addUserExperience(UserExperienceModel userExperience) {
    _userExperience.add(userExperience);
    notifyListeners();
  }
}
