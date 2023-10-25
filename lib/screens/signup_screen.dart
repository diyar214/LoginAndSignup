import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/signup_card.dart';
import '../widgets/constants.dart';
import '../widgets/app_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome To MyApp',
                style: GoogleFonts.cairo(
                  color: textColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              const SignUpCard(),
            ],
          ),
        ),
      ),
    );
  }
}
