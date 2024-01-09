import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomContrat extends StatefulWidget {
  CustomContrat({Key? key,}) : super(key: key);

  @override
  State<CustomContrat> createState() => _CustomContratState();
}

class _CustomContratState extends State<CustomContrat> {
  var items = [
    'Prospection',
    'Livraison',
    'Visite client',
  ];
  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26, width: 1)),
            child: DropdownButton2(
              value: selectedValue,
              style: const TextStyle(fontFamily: 'PoppinsRegular',color:Colors.black45,fontSize: 14),
              underline: const SizedBox(),
              hint: Center(
                  child: Row(
                    children: [
                      Icon(Icons.baby_changing_station,color: const Color.fromARGB(255, 229, 36, 36),size: 25,),
                      const Text(
                        "Choisir le type de contrat",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'PoppinsRegular',
                            ),
                      ),
                    ],
                  )),
              isExpanded: true,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Center(
                    child: Text(
                      items,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
