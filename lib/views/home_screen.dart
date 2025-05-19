import 'package:cv_builder/provider/user_form_field_provider.dart';
import 'package:cv_builder/views/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  // final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserFormFieldProvider>(
        builder: (context, value, child) {
          return FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TemplateScreen(
                              userName: 'John Doe',
                              userExperience: [
                                ...value.userExperience,
                                // UserExperienceModel(
                                //   title: 'Flutter Developer',
                                //   company: 'ABC Company',
                                //   duration: '2020-2022',
                                //   description:
                                //       'Worked on a Flutter project for a startup.',
                                // ),
                                // UserExperienceModel(
                                //   title: 'Node Developer',
                                //   company: 'ABC Company',
                                //   duration: '2020-2022',
                                //   description:
                                //       'Worked on a Flutter project for a startup.',
                                // ),
                              ],
                            ),
                      ),
                    );
                  },
                  child: Text('USE THIS TEMPLATE'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Preview')),
                FormBuilderTextField(
                  key: _emailFieldKey,
                  name: 'About',
                  decoration: const InputDecoration(labelText: 'About'),
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(),
                  //   FormBuilderValidators.email(),
                  // ]),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'School',
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(),
                  // ],
                  // ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    final isValid =
                        _formKey.currentState?.saveAndValidate() ?? false;

                    if (isValid) {
                      final values = _formKey.currentState!.value;

                      context.read<UserFormFieldProvider>().addUserExperience(
                        UserExperienceModel(
                          title: values['About'] ?? '',
                          company: values['School'] ?? '',
                          duration: '2020-2022',
                          description:
                              'Worked on a Flutter project for a startup.',
                        ),
                      );
                    } else {
                      debugPrint(
                        'Form validation failed: ${_formKey.currentState?.value}',
                      );
                    }
                  },

                  // onPressed: () {
                  //   // Validate and save the form values
                  //   _formKey.currentState?.saveAndValidate();
                  //   debugPrint(_formKey.currentState?.value.toString());

                  //   // On another side, can access all field values without saving form with instantValues
                  //   _formKey.currentState?.validate();
                  //   debugPrint(_formKey.currentState?.instantValue.toString());

                  //   context.read<UserFormFieldProvider>().addUserExperience(
                  //     UserExperienceModel(
                  //       title: _formKey.currentState?.value['title'],
                  //       company: _formKey.currentState?.instantValue['company'],
                  //       duration: '2020-2022',
                  //       description:
                  //           'Worked on a Flutter project for a startup.',
                  //     ),
                  //   );
                  // },
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
      // body:
    );
  }
}
