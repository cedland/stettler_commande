import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key, required this.client});

  final Client client;

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final _formKeyTours = GlobalKey<FormState>();

  String _transportationNumber = '';
  String _transportationCode = '';
  DateTime _transportationDate = DateTime.now();
  String _transportationSEQ = '';
  String _sellerCode = '';

  @override
  void initState() {
    super.initState();
    _transportationNumber =
        widget.client.purchaseInfo.transportation.transportationNumber;
    _transportationCode =
        widget.client.purchaseInfo.transportation.transportationCode;
    _transportationDate =
        widget.client.purchaseInfo.transportation.transportationDate.toUtc();
    _transportationSEQ =
        widget.client.purchaseInfo.transportation.transportationSEQ;
    _sellerCode = widget.client.purchaseInfo.transportation.sellerCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tournées',
        function: CustomAppBarFunction.back,
      ),
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
              margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                child: Form(
                  key: _formKeyTours,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _transportationNumber,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Tournées",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _transportationCode,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Code",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: DateFormat('dd/MM/yyyy').format(_transportationDate),
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Date",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _transportationSEQ,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "SÉQ",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _sellerCode,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Code vendeur",
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
