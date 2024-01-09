import 'package:flutter/material.dart';
class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.label,
    required this.messag,
    required this.keyboard,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final String label;
  late  String valu ='';
  final String messag;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            keyboardType: keyboard,
            onChanged: (value) => valu = value,
          ),
        ),
      ],
    );
  }
}
