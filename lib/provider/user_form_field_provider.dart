import 'package:cv_builder/app/const/constant.dart';
import 'package:flutter/cupertino.dart';

class UserFormFieldProvider extends ChangeNotifier{
  // Personal Information
  String name = '';
  String email = '';
  String phone = '';
  String address = '';
  String summary = '';

  // Dynamic lists for multiple entries
  List<Education> educationList = [Education()];
  List<Experience> experienceList = [Experience()];
  List<String> skillsList = [''];

  // Update personal info
  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePhone(String value) {
    phone = value;
    notifyListeners();
  }

  void updateAddress(String value) {
    address = value;
    notifyListeners();
  }

  void updateSummary(String value) {
    summary = value;
    notifyListeners();
  }

  void addEducation() {
    educationList.add(Education());
    notifyListeners();
  }

  void removeEducation(int index) {
    if (educationList.length > 1) {
      educationList.removeAt(index);
      notifyListeners();
    }
  }

  void updateEducation(int index, {String? degree, String? institution, String? year, String? description}) {
    if (degree != null) educationList[index].degree = degree;
    if (institution != null) educationList[index].institution = institution;
    if (year != null) educationList[index].year = year;
    if (description != null) educationList[index].description = description;
    notifyListeners();
  }

   void addExperience() {
    experienceList.add(Experience());
    notifyListeners();
  }

  void removeExperience(int index) {
    if (experienceList.length > 1) {
      experienceList.removeAt(index);
      notifyListeners();
    }
  }

  void updateExperience(int index, {String? position, String? company, String? duration, String? description}) {
    if (position != null) experienceList[index].position = position;
    if (company != null) experienceList[index].company = company;
    if (duration != null) experienceList[index].duration = duration;
    if (description != null) experienceList[index].description = description;
    notifyListeners();
  }

  // Skills methods
  void addSkill() {
    skillsList.add('');
    notifyListeners();
  }

  void removeSkill(int index) {
    if (skillsList.length > 1) {
      skillsList.removeAt(index);
      notifyListeners();
    }
  }

  void updateSkill(int index, String value) {
    skillsList[index] = value;
    notifyListeners();
  }

  // Clear all data
  void clearAll() {
    name = '';
    email = '';
    phone = '';
    address = '';
    summary = '';
    educationList = [Education()];
    experienceList = [Experience()];
    skillsList = [''];
    notifyListeners();
  }
}