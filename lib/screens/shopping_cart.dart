import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/client_list.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/widgets/bottom_nav_bar.dart';
import 'package:stettlerproapp/widgets/cart_item.dart';
import 'package:stettlerproapp/widgets/checkout_total.dart';
import 'package:stettlerproapp/providers/orders_provider.dart';

import '../classes/order.dart';
import '../classes/product.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/styled_button.dart';
import '../widgets/styled_button_small.dart';

class ShoppingCart extends ConsumerStatefulWidget {
  const ShoppingCart(
      {super.key,
        required this.cartItems,
        required this.quantityList,
        required this.totalPrice,
        required this.client});

  final List<Product> cartItems;
  final List<int> quantityList;
  final ValueNotifier<double> totalPrice;
  final Client client;

  @override
  ConsumerState<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends ConsumerState<ShoppingCart> {
  List<Product> productListCopy = [];
  int _selectedItemIndex = -1;

  void removeItemFromCart() {
    if (_selectedItemIndex >= 0 &&
        _selectedItemIndex < widget.cartItems.length) {
      setState(() {
        final removedProduct = widget.cartItems[_selectedItemIndex];
        final removedQuantity = widget.quantityList[_selectedItemIndex];

        widget.totalPrice.value -= removedProduct.price * removedQuantity;

        widget.cartItems.removeAt(_selectedItemIndex);
        widget.quantityList.removeAt(_selectedItemIndex);

        _selectedItemIndex = -1;
      });
    }
  }

  void updateCartItemQuantity(int index, int newQuantity, double newPrice) {
    setState(() {
      widget.totalPrice.value -=
          widget.cartItems[index].price * widget.quantityList[index];
      widget.quantityList[index] = newQuantity;
      widget.totalPrice.value = newPrice;
    });
  }

  void _addToOrderHistory()  {
    if (widget.cartItems.isNotEmpty) {
      final Order order = Order(
          orderNumber: _generateOrdercode(),
          clientName: widget.client.name,
          clientSurname: widget.client.surname,
          clientId: widget.client.id,
          orderedItems: widget.cartItems,
          orderedQuantity: widget.quantityList,
          isFinished: true,
          orderStatus: OrderStatus.pending);

      ref.read(ordersProvider.notifier).addOrder(order);
      widget.client.orderList.add(order);

      widget.client.cartProducts = [];
      widget.client.quantityList = [];
      widget.client.totalPrice = ValueNotifier<double>(0);
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const Home(),
      ),
    );
  }
  String _generateOrdercode() {
    final random = Random();
    const availableChars = '1234567890';
    final randomString = List.generate(
        7, (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  showCheckoutDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
            'Commande validée !',
            style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            child: Text(
              "Vous trouverez la commande dans votre historique",
              textAlign: TextAlign.center,
              style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 160,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:const Color.fromARGB(255, 229, 36, 36),),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
                child: Text("REVENIR ACCEUIL",
                  style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),),
                onPressed: () => _addToOrderHistory()),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  String showAlert(String message, Widget confirm){
    QuickAlert.show(
        context: context,
        title: 'succès',
        confirmBtnText: 'OK',
        confirmBtnColor: const Color.fromARGB(255, 229, 36, 36),
        text: message,
        type: QuickAlertType.success
    );
    return message;
  }
  /*showNoSelectedClientDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        'Pas de client sélectionné',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            child: Text(
              "Veuillez revenir en arrière et sélectionner un client",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 100, 101, 116),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 44, 213, 111)),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
              child: Text("CONFIRMER",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const ClientList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Panier",
        function: CustomAppBarFunction.back,
        additionalIcon: Icons.shopping_cart,
      ),
      /*bottomNavigationBar: BottomNavBar(
        client: widget.client,
      ),*/
      //drawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: widget.quantityList.length + 2,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < widget.quantityList.length) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedItemIndex = index;
                  });
                },
                child: CartItem(
                  cartItem: widget.cartItems[index],
                  quantity: widget.quantityList[index],
                  totalPrice: widget.totalPrice.value,
                  updateQuantityCallback: (newQuantity, newPrice) {
                    updateCartItemQuantity(index, newQuantity, newPrice);
                  },
                  isFinished: false,
                ),
              );
            } else if (index == widget.quantityList.length) {
              return CheckoutTotal(
                totalPrice: widget.totalPrice,
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 400,
                  height: 40,
                  child: StyledButton(
                    text: "VALIDER LA COMMANDE",
                    onPressed: () => showCheckoutDialog(context),
                    color: const Color.fromARGB(255, 229, 36, 36),
                  ),
                ),
              );


              /*Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: StyledButtonSmall(
                  text: "VALIDER COMMANDE",
                  onPressed: () => showCheckoutDialog(context),
                  color: Colors.blue[600]!,
                ),
              );*/
            }
          },
        ),
      ),
    );
  }
}
