import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/drawer.dart';
import 'package:stettlerproapp/widgets/enterprise_square.dart';

class Home extends StatelessWidget {
  const  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "CHOIX ENTREPRISE", function: CustomAppBarFunction.drawer),
      drawer: const CustomDrawer(),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sélection entreprise",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'LatoBold',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Complétez le profil de votre client en prenant soin de l'exactitude des informations.",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'LatoRegular',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45,),
            Container(
              //color: Colors.blue,
              height: 160,
              child: GridView(
                  padding: const EdgeInsets.all(24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  children: [
                    EnterpriseSquare(text: 'AGEMO', color: Colors.red),
                    EnterpriseSquare(text: 'MANOR', color: Colors.orange),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Container(
                //color:Colors.pink,
                height: 100,
                child: EnterpriseSquare(text: 'STELLER & DOMIG', color: Colors.brown.shade400),

              ),
            )
          ],

        ),

      ),
    );
  }
}
