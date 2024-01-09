import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';

class Quantity extends StatefulWidget {
   const Quantity({super.key, required this.product, required this.quantity});

  final Product product;
  final ValueNotifier<int> quantity;

  @override
  State<Quantity> createState() {
    return _QuantityState();
  }
}

class _QuantityState extends State<Quantity> {


  void _decreaseQuantity() {
    if (widget.quantity.value > 1) {
      setState(() {
        widget.quantity.value--;
      });
    }
  }

  void _increaseQuantity() {
    if (widget.quantity.value < widget.product.quantity) {
      setState(() {
        widget.quantity.value++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left:12, right:12 ,bottom: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: Text(
                'Quantité',
                style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _decreaseQuantity,
                icon: const Icon(
                  Icons.remove_circle,
                  size: 38,
                  color: Color.fromARGB(255, 229, 36, 36),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.quantity.value.toString(),
                style:TextStyle(fontSize: 20, fontFamily: 'LatoBold'),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: _increaseQuantity,
                icon: const Icon(
                  Icons.add_circle,
                  size: 38,
                  color: Color.fromARGB(255, 229, 36, 36),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
