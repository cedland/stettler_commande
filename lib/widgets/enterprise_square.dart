import 'package:flutter/material.dart';

import '../screens/client_list.dart';

class EnterpriseSquare extends StatelessWidget {
  const EnterpriseSquare({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ClientList()),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'LatoBold',
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
