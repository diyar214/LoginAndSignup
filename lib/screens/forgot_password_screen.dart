// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_task/widgets/constants.dart';

import '../widgets/app_bar.dart';
import '../widgets/app_button.dart';
import '../widgets/bordered_container.dart';
import '../widgets/text_form_field.dart';
import 'home_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  color: textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Enter Your Email and we will send you a reset password link',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(height: 32),
              MyTextFormField(
                label: 'Email',
                controller: emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    emailFocusNode.requestFocus();
                    return 'This field is required';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    emailFocusNode.requestFocus();
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                onSaved: (String? value) => emailController.text = value!,
              ),
              AppButton(
                title: 'Rest password',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    return;
                  } else {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
