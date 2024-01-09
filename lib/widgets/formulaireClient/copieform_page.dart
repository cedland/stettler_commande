import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../animation/fade_in_animation_controller.dart';
import '../app_bar.dart';
import '../dimensions_pages.dart';
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
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.grey[20],
              child: Image.asset(
                'assets/images/logo.png',
                height: displayHeight(context) * 0.12,
                width: displayWidth(context) * 0.25,
              ),
            ),
            Center(
              child: Text(
                "Formulaire de création des clients",
                style:TextStyle(fontSize: 20, fontFamily: 'LatoBold'),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal:6),
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
                                    'CONTINUE',
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
                        /*onStepContinue: () {
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
                        },*/
                        onStepTapped: (step) => setState(() {
                          currentStep = step;
                        }),
                        steps: getSteps(),
                      ),
                    ),
                  )),
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
              CustomFormField(
                hintText: "Entrer la civilité",
                controller: civiliteController,
                label: "Civilité",
                messag: "la civilité",

                keyboard: TextInputType.text,
              ),
              CustomFormFieldRequired(
                hintText: "Entrer le nom du client",
                controller: nomClientController,
                label: "nom client",
                messag: "le nom du client",
                keyboard: TextInputType.text,
              ),
              CustomFormField(
                hintText: "Entrer le prénom du client",
                controller: prenomClientController,
                label: "Prénom client",
                messag: "le prénom du client",
                keyboard: TextInputType.text,
              ),
              CustomFormField(
                hintText: "Entrer le nom de l'entreprise",
                controller: nomEntrepriseController,
                label: "Nom entreprise",
                messag: "le nom de l'entreprise",
                keyboard: TextInputType.text,
              ),
              CustomFormFieldRequired(
                hintText: "Entrer l'adresse",
                controller: adresseController,
                label: "Adresse",
                messag: "l'adresse",
                keyboard: TextInputType.text,
              ),
              CustomFormField(
                  hintText: "Entrer le code postal",
                  controller: cpController,
                  label: "Code postal",
                  messag: "le code postal",
                keyboard: TextInputType.text,),
              CustomFormField(
                  hintText: "Entrer la ville",
                  controller: villeController,
                  label: "ville",
                  messag: "la ville",
                keyboard: TextInputType.text,),
              CustomFormFieldRequired(
                  hintText: "Entrer le numero de téléphone",
                  controller: telController,
                  label: "Numero de téléphone",
                  messag: "le numero de téléphone",
                keyboard: TextInputType.phone,),
              CustomFormField(
                  hintText: "Entrer l'adresse mail",
                  controller: mailController,
                  label: "adresse mail",
                  messag: "l'adresse mail",
                keyboard: TextInputType.emailAddress,),
              CustomFormField(
                  hintText: "Entrer la langue",
                  controller: langueController,
                  label: "langue client",
                  messag: "la langue",
              keyboard: TextInputType.text,),
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
                  hintText: "Entrer le no compte collectif",
                  controller: compteController,
                  label: "Compte collectif ",
                  messag: "le compte collectif",
                keyboard: TextInputType.text,),
              CustomFormField(
                  hintText: "Entrer le groupe",
                  controller: groupeController,
                  label: "Groupe ",
                  messag: "le groupe",

                keyboard: TextInputType.text,),
              CustomFormField(
                  hintText: "Entrer la condition de paiement",
                  controller: conditionController,
                  label: "condition paiement",
                  messag: "la condition de paiement",
                keyboard: TextInputType.text,),
              CustomFormField(
                  hintText: "Entrer le représentant",
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
                hintText: "Entrer le montant du rabais",
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
                hintText: "Entrer le numero de la tournée",
                controller: tourneeController,
                label: "No tournée",
                messag: "No tournée",
                keyboard: TextInputType.number,),
              CustomFormField(
                hintText: "Entrer le code de la tournée",
                controller: codeController,
                label: "Code tournée",
                messag: "Code tournée",
                keyboard: TextInputType.number,),
              CustomDate(),
              CustomFormField(
                hintText: "Entrer la séquence de la tournée",
                controller: seqController,
                label: "Séquence tournée",
                messag: "Séquence tournée",
                keyboard: TextInputType.number,),
              CustomFormField(
                hintText: "Entrer le code du vendeur de la tournée",
                controller: codeVendeurController,
                label: "Code vendeur tournée",
                messag: "Code vendeur tournée",
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
                hintText: "Remarque",
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
