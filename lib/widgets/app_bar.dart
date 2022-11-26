import 'package:flutter/material.dart';

import '../widgets/constants.dart';
import '../Screens/login/login_screen.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        icon: Icon(
          Icons.arrow_back,
          color: textColor,
        ),
      ),
    );
  }