import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/screens/client_list.dart';
import 'package:stettlerproapp/screens/login.dart';
import 'package:stettlerproapp/screens/order_history.dart';
import 'package:stettlerproapp/screens/product_list.dart';
import 'package:stettlerproapp/widgets/styled_button.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void _deconnexion(){
      showDialog(
        context: context,
        builder: (ctx) => Center(
          child: AlertDialog(
            backgroundColor: Colors.white,
            title:  Text("Voulez-vous vous déconnecter?", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',),textAlign: TextAlign.center,),
            actions: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 229, 36, 36))),
                    child: Text("OUI", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black)),
                    child:  Text("NON", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      color: Colors.grey.shade50,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png'),
                    SizedBox(height: 12,),
                    Text('Norman Ledoux',style: TextStyle(fontSize: 16, fontFamily: 'LatoRegular',),)
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:8),
              child: Column(
                children: [
                  ListTile(
                    title:  Text('Accueil',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                  ListTile(
                    title:  Text('Clients',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClientList()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Produits',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductList()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Historique commandes',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderHistory()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: StyledButton(
                      text: "DECONNEXION",
                      onPressed: _deconnexion,
                      color: const Color.fromARGB(255, 229, 36, 36),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
