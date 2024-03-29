import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/constants.dart';
import '../widgets/login_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: scaffoldColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.cairo(
                      color: textColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      height: 1),
                ),
                const SizedBox(height: 30),
                const LogInCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
