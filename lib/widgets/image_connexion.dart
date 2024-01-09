import 'package:flutter/material.dart';
import 'dimensions_pages.dart';
class ImageConnexion extends StatelessWidget {
  const ImageConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.25,
      width: displayWidth(context),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/workers.png'),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}
