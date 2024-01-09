import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class General extends StatefulWidget {
  const General({super.key, required this.client});

  final Client client;

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyAddress = GlobalKey<FormState>();
  String _name = '';
  String _surname = '';
  String _addressing = '';
  String _companyName = '';
  String _phoneNumber = '';
  String _email = '';
  String _language = '';
  String _addressNumber = '';
  String _addressStreet = '';
  String _addressAditional = '';
  String _addressPostalCode = '';
  String _addressDoorCode = '';
  String _addressCity = '';

  @override
  void initState() {
    super.initState();
    _addressing =
    widget.client.gender.toString() == 'male' ? 'Monsieur' : 'Manquer';
    _name = widget.client.name;
    _surname = widget.client.surname;
    _companyName = widget.client.companyName;
    _phoneNumber = widget.client.phoneNumber;
    _email = widget.client.email;
    _language = widget.client.language;
    _addressNumber = widget.client.address.number.toString();
    _addressStreet = widget.client.address.street;
    _addressAditional = widget.client.address.additionalAddress;
    _addressPostalCode = widget.client.address.postalCode;
    _addressDoorCode = widget.client.address.doorCode;
    _addressCity = widget.client.address.city;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Général", function: CustomAppBarFunction.back,),
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
                      style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
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
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _addressing,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: "Politesse",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _surname,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "NOM Client",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _name,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Prénom",
                          labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _companyName,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Nom entreprise (optionnel)",
                          labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),

                      ),
                      TextFormField(
                        initialValue: _phoneNumber,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Numéro de téléphone",
                          labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _email,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _language,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Langue",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adresse",
                      style: TextStyle(fontSize: 15, fontFamily: 'LatoBold')
                    ),
                    Text(
                      "Indiquez l'adresse qui sera mentionnée sur les factures. Prenez-soin de l'exactitude des données.",
                        style: TextStyle(fontSize: 13, fontFamily: 'LatoRegular')
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
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Form(
                  key: _formKeyAddress,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _addressNumber,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Numéro",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _addressStreet,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Rue",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _addressAditional,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Complément adresse",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _addressPostalCode,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Code postal",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _addressDoorCode,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Code porte",
                          labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                        ),
                      ),
                      TextFormField(
                        initialValue: _addressCity,
                        enabled: false,
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Ville",
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
