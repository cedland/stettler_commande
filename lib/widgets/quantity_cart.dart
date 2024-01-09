import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';

class QuantityCart extends StatefulWidget {
  QuantityCart(
      {super.key,
      required this.product,
      required this.quantity,
      required this.totalPrice,
      required this.updateQuantityCallback,
      required this.isFinished});

  final Product product;
  double totalPrice;
  int quantity;
  final Function(int, double) updateQuantityCallback;
  final bool isFinished;

  @override
  State<StatefulWidget> createState() {
    return _QuantityCartState();
  }
}

class _QuantityCartState extends State<QuantityCart> {
  void _decreaseQuantity() {
    if (widget.quantity > 1 && !widget.isFinished) {
      setState(() {
        widget.updateQuantityCallback(
            --widget.quantity, widget.totalPrice - widget.product.price);
      });
    }
  }

  void _increaseQuantity() {
    if (widget.quantity < widget.product.quantity && !widget.isFinished) {
      setState(() {
        widget.updateQuantityCallback(
            ++widget.quantity, widget.totalPrice + widget.product.price);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 229, 36, 36),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _decreaseQuantity,
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                widget.quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 229, 36, 36),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _increaseQuantity,
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
