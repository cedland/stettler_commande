import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/separator.dart';

class CheckoutTotal extends StatefulWidget {
  const CheckoutTotal({super.key, required this.totalPrice});

  final ValueNotifier<double> totalPrice;

  @override
  State<StatefulWidget> createState() {
    return _CheckoutTotalState();
  }
}

class _CheckoutTotalState extends State<CheckoutTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin:
            const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 14,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Code Promo',
                      hintStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(const Color.fromARGB(255, 229, 36, 36),)),
                      onPressed: () {},
                      child:  Text('Appliquer',
                          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),
                          textAlign: TextAlign.center)),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Montant total',
                    style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                ),
                const Spacer(),
                /*Text('(${value.shopItems.length} produits)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                    color: const Color.fromARGB(
                        150, 124, 125, 129),),),*/
                const SizedBox(
                  width: 10,
                ),
                Text(
                  ('${widget.totalPrice.value.toStringAsFixed(2)} CHF'),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )

          /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14),
                ),
                Text(
                  'CHF ${widget.totalPrice.value.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 26),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
