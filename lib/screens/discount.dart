import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class Discount extends StatefulWidget {
  const Discount({super.key, required this.client});

  final Client client;

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  final _formKeyDisount = GlobalKey<FormState>();
  String _clientDiscount = '';

  @override
  void initState() {
    super.initState();
    _clientDiscount = widget.client.purchaseInfo.discount;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Rabais', function: CustomAppBarFunction.back,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Information de compte",
                      style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                    ),

                    Text(
                      "Complétez le profil de votre client en prenant soin de l'exactitude des informations.",
                      style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Form(
                  key: _formKeyDisount,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                         initialValue: _clientDiscount,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Rabais client",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
