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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                margin: EdgeInsets.all(3),
                width: 90,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.cartItem.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                     // color: Colors.blue,
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.cartItem.name,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(
                            Icons.cancel,
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: Colors.pink,
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(widget.cartItem.price * widget.quantity).toStringAsFixed(2)}CHF',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
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
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
