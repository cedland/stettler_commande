import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/screens/product_list.dart';
import 'package:stettlerproapp/screens/profile.dart';

import '../classes/client.dart';
import '../classes/order.dart';
import '../providers/orders_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key, required this.client, this.order});

  final Client client;
  final Order? order;

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _selectedIndex = 2;

  String _generateOrdercode() {
    final random = Random();
    const availableChars = '1234567890';
    final randomString = List.generate(
      7,
      (index) => availableChars[random.nextInt(availableChars.length)],
    ).join();

    return randomString;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        if (widget.client.cartProducts.isNotEmpty) {
          final Order order = Order(
            orderNumber: _generateOrdercode(),
            clientName: widget.client.name,
            clientSurname: widget.client.surname,
            clientId: widget.client.id,
            orderedItems: widget.client.cartProducts,
            orderedQuantity: widget.client.quantityList,
            orderStatus: OrderStatus.pending,
          );

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
        _selectedIndex = 2;

        break;
      case 1:
          if (widget.order != null && widget.order!.isFinished == false) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProductList(
                  client: widget.client,
                  order: widget.order,
                ),
              ),
            );
          } else if(widget.order == null){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProductList(client: widget.client),
              ),
            );
          }
        _selectedIndex = 2;

        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => Profile(client: widget.client),
          ),
        );
        _selectedIndex = 2;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color.fromARGB(255, 165, 165, 165),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 165, 165, 165),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Color.fromARGB(255, 165, 165, 165),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Color.fromARGB(255, 165, 165, 165),
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
        ),
        Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width * _selectedIndex / 4 +
              (MediaQuery.of(context).size.width / 4 - 30) / 2,
          child: Container(
            width: 30,
            height: 2,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
