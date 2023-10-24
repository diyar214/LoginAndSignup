import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sconderyColor,
        centerTitle: true,
        title: Text(
          'Home page',
          style: GoogleFonts.cairo(
              fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        elevation: 1,
      ),
    );
  }
}
