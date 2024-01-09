import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stettlerproapp/classes/order.dart';
import 'package:stettlerproapp/widgets/progress_indicator.dart';


class OrderData extends StatelessWidget {
  const OrderData({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          order.isFinished
              ? Container(
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
                )
              : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 243, 243),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.watch_later_outlined,
                    color: Color.fromARGB(255, 239, 84, 72),
                    size: 30,
                  ),
                ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  order.orderNumber,
                  style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        order.clientName,
                        style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                      ),
                      Text(
                        order.clientSurname,
                        style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),

                      ),
                      Text(
                        '|',
                        style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                      ),
                      Text(
                        order.clientId,
                        style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                      ),
                    ]
                        .map((widget) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: widget,
                            ))
                        .toList(),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: order.orderStatus == OrderStatus.pending
                ? Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Validée',
                          style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular',color:Colors.blue[400]),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(order.orderDate),
                          style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: 85,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const CustomRoundedLinearProgressIndicator(
                              backgroundColor:
                                  Color.fromARGB(255, 246, 246, 246),
                              valueColor: Color.fromARGB(255, 239, 84, 72),
                              value: 0.6,
                              minHeight: 10,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        Text(
                          'A terminer',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.blue[500]),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
