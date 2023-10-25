import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import 'already_have_an_account.dart';
import 'app_button.dart';
import 'bordered_container.dart';
import 'text_form_field.dart';
import 'constants.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode contactNumFocusNode = FocusNode();

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign up',
            style: GoogleFonts.cairo(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
          MyTextFormField(
            label: 'Name',
            icon: Icons.person,
            hint: 'Full name',
            controller: nameController,
            focusNode: nameFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            obscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                nameFocusNode.requestFocus();
                return 'This field is required';
              }
              return null;
            },
            onSaved: (String? value) => nameController.text = value!,
          ),
          MyTextFormField(
            label: 'Email',
            icon: Icons.email,
            hint: 'example@example.com',
            controller: emailController,
            focusNode: emailFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                emailFocusNode.requestFocus();
                return 'This field is required';
              } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                emailFocusNode.requestFocus();
                return "Please enter a valid email address";
              }
              return null;
            },
            onSaved: (String? value) => emailController.text = value!,
          ),
          MyTextFormField(
            label: 'Password',
            icon: Icons.lock,
            hint: 'e.g: Password123',
            controller: passwordController,
            focusNode: passwordFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                passwordFocusNode.requestFocus();
                return 'This field is required';
              } else if (value.length < 8) {
                passwordFocusNode.requestFocus();
                return 'Password too short';
              }
              return null;
            },
            onSaved: (String? value) => passwordController.text = value!,
            suffixIcon: IconButton(
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                    size: 22)),
          ),
          MyTextFormField(
            label: 'Contact number',
            icon: Icons.phone,
            hint: '0782000000',
            controller: contactNumController,
            focusNode: contactNumFocusNode,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            obscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                contactNumFocusNode.requestFocus();
                return 'This field is required';
              } else if (value.length < 11) {
                contactNumFocusNode.requestFocus();
                return 'Phone Number must be 11 digits';
              }
              return null;
            },
            onSaved: (String? value) => contactNumController.text = value!,
          ),
          AppButton(
            title: 'Sign up',
            onTap: () {
              if (!_formKey.currentState!.validate()) {
                return;
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false);
              }
            },
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
