import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../animation/fade_in_animation_controller.dart';
import '../app_bar.dart';
import 'custom_date.dart';
import 'custom_form_field.dart';
import 'custom_form_field_required.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int currentStep = 0;
  final adresseController = TextEditingController();
  final civiliteController =TextEditingController();
  final nomClientController =TextEditingController();
  final prenomClientController =TextEditingController();
  final nomEntrepriseController = TextEditingController();
  final cpController = TextEditingController();
  final langueController = TextEditingController();
  final mailController = TextEditingController();
  final telController = TextEditingController();
  final villeController = TextEditingController();
  final compteController = TextEditingController();
  final groupeController = TextEditingController();
  final representantController = TextEditingController();
  final conditionController = TextEditingController();
  final rabaisController = TextEditingController();
  final remarqueController = TextEditingController();
  final tourneeController = TextEditingController();
  final codeController = TextEditingController();
  final dateController = TextEditingController();
  final seqController = TextEditingController();
  final codeVendeurController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final _formkey4 = GlobalKey<FormState>();
  final _formkey5 = GlobalKey<FormState>();
  String? gender;
  String dropdownvalue = '';
  var items = [
    'Livré',
    'En attente',
  ];
  final MultiSelectController _controller = MultiSelectController();

  final List<ValueItem> _selectedOptions = [];


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startLoginAnimation();
    final size = MediaQuery.of(context).size;
    var mediaquery = MediaQuery.of(context);
    var brightness = mediaquery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    String showAlert(String title, String message, QuickAlertType alert) {
      QuickAlert.show(
          context: context,
          title: title,
          confirmBtnText: 'OK',
          confirmBtnColor: const Color.fromARGB(255, 229, 36, 36),
          text: message,
          type: alert);
      return message;
    }

    return Scaffold(
        appBar: CustomAppBar(title: "Création client", function: CustomAppBarFunction.back,),
        backgroundColor: Colors.grey.shade50,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5),
              child: Center(
                child: Text(
                  "Nouveau client",
                  style:TextStyle(fontSize: 20, fontFamily: 'LatoBold'),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(
              child: Theme(
                data: ThemeData(
                  canvasColor: Colors.grey[100],
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: const Color.fromARGB(255, 229, 36, 36),
                        background: Colors.red,
                        secondary: Colors.green,
                      ),
                ),
                child: Container(
                  width: double.infinity,
                  child: Stepper(
                    type: StepperType.vertical,
                    controlsBuilder: (context, _) {
                      return Row(
                        children: <Widget>[
                          Container(
                            color: const Color.fromARGB(255, 229, 36, 36),
                            child: TextButton(
                              onPressed: () {
                        bool isLastStep =
                        (currentStep == getSteps().length - 1);
                        if (isLastStep) {
                            //Navigator.pop(context);
                            //showAlert('Le client a été créé !');
                            if (_formkey1.currentState!.validate() &&
                                _formkey2.currentState!.validate() &&
                                _formkey3.currentState!.validate() &&
                                _formkey4.currentState!.validate() &&
                                _formkey5.currentState!.validate()) {
                              Navigator.pop(context);
                              showAlert('succès', 'Le client a été créé !',
                                  QuickAlertType.success);
                            } else {
                              showAlert(
                                  "Echec !",
                                  "Veuillez remplir les  champs requis",
                                  QuickAlertType.error);
                            }
                        } else {
                            setState(() {
                              currentStep += 1;
                            });
                        }
                      },
                              child: const Text(
                                'CONTINUER',
                                style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            color:Colors.black,
                            child: TextButton(
                              onPressed: () { Navigator.pop(context);},
                              child: const Text(
                                'ANNULER',
                                style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    currentStep: currentStep,
                    onStepCancel: () => currentStep == 0
                        ? null
                        : setState(() {
                            currentStep -= 1;
                          }),
                    onStepTapped: (step) => setState(() {
                      currentStep = step;
                    }),
                    steps: getSteps(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text(
          "Général ",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey1,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 360,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(150, 124, 125, 129),
                    ),

                    borderRadius: BorderRadius.circular(8)
                ),
                // width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Civilité :",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(value: "Mme", groupValue: gender, onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            },fillColor:
                            MaterialStateColor.resolveWith((states) => Colors.red),),
                            Text("Mme",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular'))
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: "Mr", groupValue: gender, onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            },fillColor:
                            MaterialStateColor.resolveWith((states) => Colors.red),),
                            Text("Mr",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular'))
                          ],
                        )

                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: 7,),
              CustomFormFieldRequired(
                hintText: "Nom :",
                controller: nomClientController,
                label: "nom client",
                messag: "le nom du client",
                keyboard: TextInputType.text,
              ),
              CustomFormField(
                hintText: "Prénom :",
                controller: prenomClientController,
                label: "Prénom client",
                messag: "le prénom du client",
                keyboard: TextInputType.text,
              ),

              CustomFormFieldRequired(
                hintText: "Entreprise :",
                controller: nomEntrepriseController,
                label: "Nom entreprise",
                messag: "le nom de l'entreprise",
                keyboard: TextInputType.text,
              ),
              CustomFormFieldRequired(
                hintText: "Adresse :",
                controller: adresseController,
                label: "Adresse",
                messag: "l'adresse",
                keyboard: TextInputType.text,
              ),
              CustomFormField(
                  hintText: "Code postal :",
                  controller: cpController,
                  label: "Code postal",
                  messag: "le code postal",
                keyboard: TextInputType.number,),
              CustomFormFieldRequired(
                  hintText: "Ville :",
                  controller: villeController,
                  label: "Ville",
                  messag: "la ville",
                keyboard: TextInputType.text,),
              CustomFormFieldRequired(
                  hintText: "Téléphone :",
                  controller: telController,
                  label: "Téléphone",
                  messag: "le numéro de téléphone",
                keyboard: TextInputType.phone,),
              CustomFormField(
                  hintText: "Email :",
                  controller: mailController,
                  label: "Email",
                  messag: "l'adresse email",
                keyboard: TextInputType.emailAddress,),
              /*CustomFormField(
                  hintText: "Entrer la langue",
                  controller: langueController,
                  label: "langue client",
                  messag: "la langue",
              keyboard: TextInputType.text,),*/
              Container(
                height: 60,
                width: 360,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(150, 124, 125, 129),
                    ),
                    borderRadius: BorderRadius.circular(8)
                ),
                // width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child:  MultiSelectDropDown(
                  onOptionSelected: (List<ValueItem> selectedOptions) {},
                  options: const <ValueItem>[
                    ValueItem(label: 'Français', value: 'Français'),
                    ValueItem(label: 'Anglais', value: 'Anglais'),
                    ValueItem(label: 'Allemand', value: 'Allemand'),
                    ValueItem(label: 'Espagnol', value: 'Espagnol'),
                    ValueItem(label: 'Chinois', value: 'Chinois'),
                    ValueItem(label: 'Italien', value: 'Italien'),
                  ],
                  selectionType: SelectionType.single,
                  hint: "Langue",
                  inputDecoration: BoxDecoration(

                  ),
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text(
          "Comptabilité ",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey2,
          child: Column(
            children: [
              CustomFormFieldRequired(
                  hintText: "nº compte collectif :",
                  controller: compteController,
                  label: "nº compte collectif ",
                  messag: "le nº compte collectif",
                keyboard: TextInputType.number,),
              CustomFormField(
                  hintText: "Groupe :",
                  controller: groupeController,
                  label: "Groupe ",
                  messag: "le groupe",
                keyboard: TextInputType.text,),
              CustomFormField(
                  hintText: "Condition de paiement :",
                  controller: conditionController,
                  label: "Condition paiement",
                  messag: "la condition de paiement",
                keyboard: TextInputType.text,),
              CustomFormField(
                  hintText: "Représentant :",
                  controller: representantController,
                  label: "Représentant",
                  messag: "le représentant",
                keyboard: TextInputType.text,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text(
          "Rabais",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey3,
          child: Column(
            children: [

              CustomFormField(
                hintText: "Rabais :",
                controller: rabaisController,
                label: "Rabais",
                messag: "le montant du rabais",
                keyboard: TextInputType.number,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: Text(
          "Tournée",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey4,
          child: Column(
            children: [
              CustomFormField(
                hintText: "nº de la tournée :",
                controller: tourneeController,
                label: "nº de la tournée",
                messag: "le nº de la tournée",
                keyboard: TextInputType.number,),
              CustomFormField(
                hintText: "Code de la tournée :",
                controller: codeController,
                label: "Code tournée",
                messag: "le code de la  tournée",
                keyboard: TextInputType.number,),
              CustomDate(),
              CustomFormField(
                hintText: "Séquence de la tournée :",
                controller: seqController,
                label: "Séquence tournée",
                messag: "la séquence de la  tournée",
                keyboard: TextInputType.number,),
              CustomFormField(
                hintText: "Code du vendeur :",
                controller: codeVendeurController,
                label: "Code vendeur",
                messag: "le Code du vendeur",
                keyboard: TextInputType.number,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: Text(
          "Remarque",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey5,
          child: Column(
            children: [
              CustomFormField(
                hintText: "Remarque :",
                controller: remarqueController,
                label: "Remarque",
                messag: "Remarque",
                keyboard: TextInputType.text,),
            ],
          ),
        ),
      ),
    ];
  }
}
