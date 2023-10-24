// ignore: implementation_imports
// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/forgot_password/forgot_password_layout.dart';
import '../screens/home_screen.dart';
import '../screens/signup_screen.dart';
import 'already_have_an_account.dart';
import 'bordered_container.dart';
import 'text_form_field.dart';
import 'extension.dart';
import 'constants.dart';

class LogInCard extends StatefulWidget {
  const LogInCard({super.key});

  @override
  State<LogInCard> createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNode().unfocus(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Login',
                style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ),
            MyTextFormField(
                label: const Text('Email'),
                controller: emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                }),
            MyTextFormField(
                label: const Text('Password'),
                controller: passwordController,
                focusNode: passwordFocusNode,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                index: 1,
                validator: (value) {
                  if (value!.isEmpty || value.isValidPassword) {
                    passwordFocusNode.requestFocus();
                    return 'Enter a valid password';
                  }
                }),
            const SizedBox(height: 8),
            const ForgotPasswordLayout(),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: GestureDetector(
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
                    'Login',
                    style: GoogleFonts.cairo(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: sconderyColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
