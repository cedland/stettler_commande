import 'package:flutter/material.dart';

class ClientSettings extends StatelessWidget {
  const ClientSettings({super.key, required this.icon, required this.text, required this.onPressed});

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(icon, size: 26,),
                const SizedBox(width: 10,),
                Text(text, style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
