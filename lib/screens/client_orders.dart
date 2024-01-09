import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/order_details.dart';
import 'package:stettlerproapp/widgets/order_data.dart';

import '../classes/product.dart';
import '../data/dummy_data.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class ClientOrders extends ConsumerStatefulWidget {
  const ClientOrders({super.key, required this.client});

  final Client client;
  @override
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends ConsumerState<ClientOrders> {
  double calculateTotalPrice(List<int> quantityList, List<Product> orderedItems) {
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
        title: "Commandes des clients",
        function: CustomAppBarFunction.back,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Vos dernières commandes",
                style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                //final filteredOrders = ref.watch(ordersProvider);
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.client.orderList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: OrderData(
                          order: widget.client.orderList[index],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
