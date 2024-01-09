import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});

  final String text;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize: const Size(330, 50),
          foregroundColor: const Color.fromARGB(255, 229, 36, 36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'LatoBold',
        ),
        ),
      ),
    );
  }
}
