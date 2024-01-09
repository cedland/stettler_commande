import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/order_history.dart';
import 'package:stettlerproapp/widgets/bottom_nav_bar.dart';
import 'package:stettlerproapp/widgets/cart_item.dart';
import 'package:stettlerproapp/widgets/checkout_total.dart';

import '../classes/order.dart';
import '../classes/product.dart';
import '../providers/orders_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/styled_button_small.dart';

class OrderDetails extends ConsumerStatefulWidget {
  const OrderDetails({
    super.key,
    required this.order,
    required this.cartItems,
    required this.quantityList,
    required this.totalPrice,
    required this.client,
  });

  final Order order;
  final List<Product> cartItems;
  final List<int> quantityList;
  final ValueNotifier<double> totalPrice;
  final Client client;

  @override
  ConsumerState<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {
  void updateCartItemQuantity(int index, int newQuantity, double newPrice) {
    setState(() {
      widget.quantityList[index] = newQuantity;
      widget.totalPrice.value = newPrice;
    });
  }

  void _updateOrderHistory(Order oldOrder) {
    if (List.from(widget.cartItems).isNotEmpty) {
      Order newOrder = Order(
          orderNumber: oldOrder.orderNumber,
          orderedItems: List.from(widget.cartItems),
          orderedQuantity: List.from(widget.quantityList),
          isFinished: true,
          clientId: oldOrder.clientId,
          clientName: oldOrder.clientName,
          clientSurname: oldOrder.clientSurname,
          orderStatus: oldOrder.orderStatus,
          orderDate: oldOrder.orderDate);

      ref.read(ordersProvider.notifier).updateOrder(newOrder);
      widget.client.orderList.remove(oldOrder);
      widget.client.orderList.add(newOrder);
    }
  }

  showCheckoutDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        'Commande validée !',
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
              "Vous trouverez la commande dans votre historique",
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
            width: 160,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 44, 213, 111)),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
                child: Text("REVENIR ACCEUIL",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
                onPressed: () {
                  _updateOrderHistory(widget.order);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const OrderHistory(),
                    ),
                  );
                }),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Détails de la commande",
        function: CustomAppBarFunction.back,
        additionalIcon: widget.order.isFinished ? null : Icons.delete,
        additionalFunction: removeItemFromCart,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    isFinished: widget.order.isFinished),
              );
            } else if (index == widget.quantityList.length) {
              return CheckoutTotal(
                totalPrice: widget.totalPrice,
              );
            } else {
              return widget.order.isFinished
                  ? Container()
                  : Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: StyledButtonSmall(
                        text: "VALIDER COMMANDE",
                        onPressed: () => showCheckoutDialog(context),
                        color: Colors.blue[600]!,
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
