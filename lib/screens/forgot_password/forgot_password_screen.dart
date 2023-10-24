// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_task/widgets/constants.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/bordered_container.dart';
import '../../widgets/text_form_field.dart';
import '../home_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
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
              const SizedBox(height: 90),
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
              const SizedBox(height: 20),
              MyTextFormField(
                  label: const Text('Email'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  }),
              const SizedBox(height: 25.0),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (route) => false);
                  }
                },
                child: BorderedContainer(
                  color: primaryColor,
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.cairo(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: sconderyColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
