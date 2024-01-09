import 'package:flutter/material.dart';
import 'dimensions_pages.dart';

class LogoConnexion extends StatelessWidget {
  const LogoConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.grey[20],
      child: Image.asset(
        'assets/images/logo.png',
        height: displayHeight(context) * 0.15,
        width: displayWidth(context) * 0.25,
      ),
    );
  }
}
