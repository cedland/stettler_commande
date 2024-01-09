import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/styled_button.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                width: double.infinity,
                child: Image.asset('lib/assets/images/no_internet.png'),
              ),
              
              const SizedBox(height: 100,),
               Text(
                "Vérifiez votre Connextion",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                "Il semble que vous n'êtes pas connecté au web, merci de vérifier",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 200),
              StyledButton(text: 'Faire un nouvel essai', onPressed: (){}, color: const Color.fromARGB(255, 60, 60, 59)),
            ],
          ),
        ),
      ),
    );
  }
}
