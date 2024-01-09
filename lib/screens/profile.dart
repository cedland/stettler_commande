
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/accounting.dart';
import 'package:stettlerproapp/screens/client_orders.dart';
import 'package:stettlerproapp/screens/general.dart';
import 'package:stettlerproapp/screens/product_list.dart';
import 'package:stettlerproapp/screens/remarks.dart';
import 'package:stettlerproapp/screens/sales.dart';
import 'package:stettlerproapp/screens/delivery.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/client_settings.dart';

import '../widgets/styled_button_small.dart';
import 'discount.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key, required this.client});

  final Client client;

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends ConsumerState<Profile> {
  int productListCount = 0;

  @override
  void initState() {
    productListCount = widget.client.cartProducts.length;
    super.initState();
  }
  void createCommande(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductList(client: widget.client)),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget content = const Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
        function: CustomAppBarFunction.back,
      ),
      body: Text("No people found"),
    );

    content = SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          child: Text('${widget.client.name} ${widget.client.surname}',
                            style:TextStyle(fontSize: 18, fontFamily: 'LatoBold'),)
                        ),
                        Text(
                          widget.client.email,
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),

                        ),
                        //const SizedBox(height: 20),
                        Text(
                          widget.client.phoneNumber,
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        ),
                        Text(
                          '${widget.client.address.number} ${widget.client.address.street} ${widget.client.address.postalCode} ${widget.client.address.city}',
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        )
                      ]
                          .map((widget) => Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5),
                        child: widget,
                      ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information client",
                    style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                  ),
                  Text(
                    "Suivez vos bulletins de livraison en direct et votre catalogue d'objets.",
                    style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              ClientSettings(
                icon: Icons.history,
                text: "Historique",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ClientOrders(
                        client: widget.client,
                      ),
                    ),
                  );
                },
              ),
              ClientSettings(
                  icon: Icons.person_2_outlined,
                  text: "Général",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => General(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.settings,
                  text: "Comptabilité",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Accounting(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.shopping_cart,
                  text: "Ventes",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sales(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.money,
                  text: "Rabais",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Discount(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.local_shipping,
                  text: "Tournées",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Delivery(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.text_snippet,
                  text: "Remarques",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Remarks(client: widget.client),
                      ),
                    );
                  }),
              SizedBox(height: 8,)
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: "Profil client",
        function: CustomAppBarFunction.back,
        additionalIcon: Icons.shopping_cart,
        additionalFunction: createCommande,
        //saveUnfinishedOrder: _addToOrderHistory /*productListCount > 0 ? _addToOrderHistory : null,*/
      ),
      body: content,
    );
  }
}
