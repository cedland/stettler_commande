import 'package:flutter/material.dart';

enum CustomAppBarFunction {
  back,
  drawer,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.function,
    this.additionalIcon,
    this.additionalFunction,
    this.saveUnfinishedOrder,
  });

  final String title;
  final CustomAppBarFunction function;
  final IconData? additionalIcon;
  final Function()? additionalFunction;
  final Function()? saveUnfinishedOrder;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          icon: function == CustomAppBarFunction.back
              ? const Icon(Icons.arrow_back_sharp)
              : const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            if (function == CustomAppBarFunction.drawer) {
              Scaffold.of(context).openDrawer();
            } else {
              saveUnfinishedOrder?.call();
              Navigator.pop(context);
            }
          },
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: IconButton(
              icon: Icon(
                additionalIcon,
                color: Colors.white,
              ),
              onPressed: additionalFunction,
              iconSize: 25),
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 229, 36, 36),
      centerTitle: true,
      title: Text(title,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'LatoBold',
          color: Colors.white
        ),),
      elevation: 0,
    );
  }
}
