import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/order.dart';
import 'package:stettlerproapp/screens/order_details.dart';
import 'package:stettlerproapp/widgets/order_data.dart';

import '../classes/product.dart';
import '../data/dummy_data.dart';
import '../providers/orders_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/dimensions_pages.dart';
import '../widgets/drawer.dart';

class OrderHistory extends ConsumerStatefulWidget {
  const OrderHistory({super.key});

  @override
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends ConsumerState<OrderHistory> {
  final TextEditingController _searchController = TextEditingController();
  List<Order> filteredOrders = [];
  List<Order> orderList = [];
  //late Future<void> _ordersFuture;

  @override
  void initState() {
    super.initState();
    //_ordersFuture = ref.read(ordersProvider.notifier).loadOrders();
    filteredOrders = orderList;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /*void initialList() {
    for (final client in people) {
      for (final order in client.orderList) {
        if (order.orderStatus == OrderStatus.pending) {
          ref.read(ordersProvider.notifier).addOrder(order);
        }
      }
    }
    orderList = ref.read(ordersProvider);
  }*/

  void _searchOrder(String query) {
    final suggestions = orderList.where((order) {
      final name = order.clientName.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() {
      filteredOrders = suggestions;
    });
  }

  double calculateTotalPrice(
      List<int> quantityList, List<Product> orderedItems) {
    double totalPrice = 0;

    for (int i = 0; i < quantityList.length; i++) {
      double price = orderedItems[i].price;
      totalPrice += quantityList[i] * price;
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Historique des commandes",
        function: CustomAppBarFunction.back,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Column(
          children: [
            Container(
              width: displayWidth(context) *0.95,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.search, color: const Color.fromARGB(150, 124, 125, 129),),
                    SizedBox(
                      height: 50,
                      width:  displayWidth(context) *0.75,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TextFormField(
                          onChanged: _searchOrder,
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'N° Bulletin ou référence client',
                            hintStyle: TextStyle(fontSize: 14, fontFamily: 'LatoLight',color: const Color.fromARGB(150, 124, 125, 129),),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Vos dernières commandes",
                style: TextStyle(fontSize: 16, fontFamily: 'LatoBold',)
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final filteredOrders = ref.watch(ordersProvider);
                return Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => OrderDetails(
                              order: filteredOrders[index],
                              client: people.firstWhere((person) =>
                                  person.id == filteredOrders[index].clientId),
                              cartItems: filteredOrders[index].orderedItems,
                              quantityList:
                                  filteredOrders[index].orderedQuantity!,
                              totalPrice: ValueNotifier<double>(
                                  calculateTotalPrice(
                                      filteredOrders[index].orderedQuantity!,
                                      filteredOrders[index].orderedItems)),
                            ),
                          ),
                        );
                      },
                      child: OrderData(
                        order: filteredOrders[index],
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
