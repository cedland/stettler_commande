import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/quantity_cart.dart';

import '../classes/product.dart';

class CartItem extends StatefulWidget {
  const CartItem(
      {super.key,
      required this.cartItem,
      required this.quantity,
      required this.totalPrice,
      required this.updateQuantityCallback,
      required this.isFinished});

  final Product cartItem;
  final int quantity;
  final double totalPrice;
  final Function(int, double) updateQuantityCallback;
  final bool isFinished;

  @override
  State<StatefulWidget> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.cartItem.image),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(widget.cartItem.name,
                      style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '${(widget.cartItem.price * widget.quantity).toStringAsFixed(2)}CHF',
                        style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                      ),
                    ),
                    QuantityCart(
                      product: widget.cartItem,
                      quantity: widget.quantity,
                      totalPrice: widget.totalPrice,
                      updateQuantityCallback: widget.updateQuantityCallback,
                      isFinished: widget.isFinished
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
