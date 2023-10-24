// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import 'already_have_an_account.dart';
import 'bordered_container.dart';
import 'text_form_field.dart';
import 'extension.dart';
import 'constants.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Sign up',
              style: GoogleFonts.cairo(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ),
          MyTextFormField(
              label: Text(
                'Name',
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  color: labalAndTextButtonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty || value.isValidName)
                  return 'Enter valid name';
              }),
          MyTextFormField(
              label: Text(
                'Email',
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  color: labalAndTextButtonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
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
              label: Text(
                'Password',
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  color: labalAndTextButtonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              index: 1,
              validator: (value) {
                if (value!.isEmpty || value.isValidPassword) {
                  return 'Enter a valid password';
                }
              }),
          MyTextFormField(
              label: Text(
                'Contact no.',
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  color: labalAndTextButtonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty || value.isValidPhone) {
                  return 'Enter a valid phone number';
                }
              }),
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
                  'Sign in',
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
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
