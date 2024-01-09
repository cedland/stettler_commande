import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class Remarks extends StatefulWidget {
  const Remarks({super.key, required this.client});

  final Client client;

  @override
  State<Remarks> createState() => _RemarksState();
}

class _RemarksState extends State<Remarks> {
  final _formKeyRemarksDelivery = GlobalKey<FormState>();
  final _formKeyRemarksPhone = GlobalKey<FormState>();

  String _remarksDelivery = '';
  String _remarksPhone = '';

  @override
  void initState() {
    super.initState();
    _remarksDelivery = widget.client.purchaseInfo.remarksDelivery;
    _remarksPhone = widget.client.purchaseInfo.remarksPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Remarques',
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
                  key: _formKeyRemarksDelivery,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _remarksDelivery,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Remarques p/livreur",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                child: Form(
                  key: _formKeyRemarksPhone,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _remarksPhone,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Remarques p/téléphone",
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
