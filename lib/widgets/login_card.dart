import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_task/widgets/app_button.dart';

import 'forgot_password_layout.dart';
import '../screens/home_screen.dart';
import '../screens/signup_screen.dart';
import 'already_have_an_account.dart';
import 'bordered_container.dart';
import 'text_form_field.dart';
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

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNode().unfocus(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: GoogleFonts.cairo(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
            MyTextFormField(
              label: 'Email',
              icon: Icons.email,
              hint: 'example@example.com',
              controller: emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              textInputAction: TextInputAction.next,
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
              textInputAction: TextInputAction.done,
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
              suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: primaryColor,
                      size: 22)),
              onSaved: (String? value) => passwordController.text = value!,
            ),
            const SizedBox(height: 8),
            const ForgotPasswordLayout(),
            AppButton(
              title: 'Log in',
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
