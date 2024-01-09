import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CustomDate extends StatefulWidget {
  CustomDate({Key? key,}) : super(key: key);


  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: dateInput,
            decoration: InputDecoration(
              hintText: "Date :",
              hintStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 229, 36, 36),
                ),
              ),
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Sélectionner une date';
              }
              return null;
            },
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                //locale: const Locale("fr", "FR"),
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: const Color.fromARGB(255, 229, 36, 36), // <-- SEE HERE
                        onPrimary: Colors.white, // <-- SEE HERE
                        onSurface: Colors.grey, // <-- SEE HERE
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: const Color.fromARGB(255, 229, 36, 36), // button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (pickedDate != null) {
                String formattedDate =
                DateFormat('dd/MM/yyyy').format(pickedDate);
                setState(() {
                  dateInput.text = formattedDate;
                });
              }
            },
          ),
        ),

      ],
    );
  }
}
