import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/widgets/styled_button.dart';

import '../widgets/image_connexion.dart';
import '../widgets/logo_connexion.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String login = '';
  String motDePass = '';
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  bool isAuth = false;

  void _submit() {
    if(_formkey.currentState!.validate()){
      if(emailController.text =='123456' && passwordController.text =='111111')
      {
        emailController.clear();
        passwordController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
      else{
        emailController.clear();
        passwordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Identifiant ou mot de passe incorrect !',style:Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: const Color.fromARGB(
                    150, 124, 125, 129),
                fontSize: 14),)),
          ),
        );
      }
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        //backgroundColor: Colors.grey.shade50,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: LogoConnexion(),
                    ),
                    const SizedBox(height: 8,),
                    const ImageConnexion(),
                    const SizedBox(height: 20,),
                    Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'LatoBold',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Votre identifiant',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(
                                150, 124, 125, 129),
                            fontFamily: 'LatoLight',
                          ),
                          hintText: 'Entrer votre identifiant',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(
                                150, 124, 125, 129),
                            fontFamily: 'LatoLight',
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          prefixIcon: const Icon(Icons.email,color: const Color.fromARGB(150, 124, 125, 129),),
                          suffix: const InkWell(
                            onTap: null,
                            child: Icon(Icons.accessibility,color: const Color.fromARGB(150, 124, 125, 129),),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer votre identifiant';
                        }
                        return null;
                      },
                      onChanged: (value) => login = value,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(
                                150, 124, 125, 129),
                            fontFamily: 'LatoLight',
                          ),
                          hintText: 'Entrer votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(
                                150, 124, 125, 129),
                            fontFamily: 'LatoLight',
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          prefixIcon: const Icon(Icons.lock,color: const Color.fromARGB(150, 124, 125, 129),),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle
                                ? Icons.visibility
                                : Icons.visibility_off,color: const Color.fromARGB(150, 124, 125, 129),),
                          )),
                      obscureText: passToggle,
                      onChanged: (value) => motDePass = value,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'mot de passe incorect';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    StyledButton(
                      text: "CONNEXION",
                      onPressed: _submit,
                      color: const Color.fromARGB(255, 229, 36, 36),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
