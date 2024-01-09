import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/widgets/multiple_choice.dart';
import 'package:intl/intl.dart';

import '../widgets/styled_button_small.dart';

class Sales extends StatefulWidget {
  const Sales({super.key, required this.client});

  final Client client;

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOther = GlobalKey<FormState>();
  final _formKeyHours = GlobalKey<FormState>();

  String _registrantSell = '';
  DateTime _purchaseDate = DateTime.now();
  String? _registrantReturn = '';
  DateTime? _returnDate;
  String _discount = '';
  String _discountInvoice = '';
  String _priceCategory = '';
  String _startDeliveryHour = '';
  String _endDeliveryHour = '';
  //List<String> _selectedBillingPeriod = [];
  //List<String> _selectedBillingOther = [];

  @override
  void initState() {
    super.initState();
    _registrantSell = widget.client.purchaseInfo.registrantSell;
    _purchaseDate = widget.client.purchaseInfo.purchaseDate.toUtc();
    _registrantReturn = widget.client.purchaseInfo.registrantReturn;
    _returnDate = widget.client.purchaseInfo.returnDate?.toUtc();
    _discount = widget.client.purchaseInfo.discount;
    _discountInvoice = widget.client.purchaseInfo.discountInvoice;
    _priceCategory = widget.client.purchaseInfo.priceCategory;
    _startDeliveryHour =
        DateFormat.Hm().format(widget.client.purchaseInfo.startDeliveryHour);
    _endDeliveryHour =
        DateFormat.Hm().format(widget.client.purchaseInfo.endDeliveryHour);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Ventes",
        function: CustomAppBarFunction.back,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 13),
              child: Text(
                "Client acquis/annulé par",
                style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _registrantSell,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Client acquis par",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: DateFormat('dd/MM/yyyy').format(_purchaseDate),
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Date",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _registrantReturn,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Client annulé par",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _returnDate == null ? '' : DateFormat('dd/MM/yyyy').format(_purchaseDate),
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Date",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 13),
              child: Text(
                "Autres",
                style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Form(
                  key: _formKeyOther,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _discount,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Rabais",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _discountInvoice,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Escompte s/bdl (facture)",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _priceCategory,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Categorie prix",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 13),
              child: Text(
                "Heures livraison",
                style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Form(
                  key: _formKeyHours,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _startDeliveryHour,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Début",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _endDeliveryHour,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Fin",
                            labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 13),
              child: Text(
                "Période facturation",
                style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
              ),
            ),
            MultipleChoice(items: billingPeriod),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 13),
              child: Text(
                "Actions supplémentaires",
                style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
              ),
            ),

            MultipleChoice(items: billingOther),
          ],
        ),
      ),
    );
  }
}
