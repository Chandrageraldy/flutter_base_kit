import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({required this.field, required this.placeholder, required this.validator, super.key});

  final FormFields field;
  final String placeholder;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: field.name,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
      obscureText: field == FormFields.password ? true : false,
      validator: validator,
    );
  }
}
