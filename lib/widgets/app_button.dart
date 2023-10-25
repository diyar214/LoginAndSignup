import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bordered_container.dart';
import 'constants.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const AppButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: GestureDetector(
        onTap: onTap,
        child: BorderedContainer(
          color: primaryColor,
          child: Text(
            title,
            style: GoogleFonts.cairo(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: sconderyColor),
          ),
        ),
      ),
    );
  }
}
