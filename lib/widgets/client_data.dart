import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';


class ClientData extends StatelessWidget {
  const ClientData({super.key, required this.client});

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          /*client.orderList[client.orderList.length - 1].orderStatus ==
                  OrderStatus.pending
              ?*/ Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 246, 218),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: Color.fromARGB(255, 34, 193, 87),
                    size: 30,
                  ),
                ),

          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  client.orderList[client.orderList.length - 1].orderNumber,
                  style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                ),
              ),
              Row(
                children: [
                  Text(
                    client.name,
                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                  ),
                  Text(
                    client.surname,
                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                  ),
                  Text(
                    '|',
                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                  ),
                  Text(
                    client.id,
                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                  ),
                ]
              )
            ],
          ),
        ],
      ),
    );
  }
}
