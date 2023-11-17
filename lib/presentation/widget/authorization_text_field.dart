import 'package:flutter/material.dart';
import 'package:movie_list_app/common/theme/app_theme.dart';


class AuthorizationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isObscure;
  final Widget? iconWidget;
  final String? Function(String?)? validator;
  const AuthorizationTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.iconWidget,
      this.isObscure = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.red,
      obscureText: isObscure,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTheme.defaults().textTheme.bodyLarge?.copyWith(color: Colors.grey),
        alignLabelWithHint: true,
        suffixIcon: iconWidget,
        suffixIconColor: Colors.blue,
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen),
        ),
      ),
      textAlign: TextAlign.start,
    );
  }
}
