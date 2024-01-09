import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/quantity.dart';
import 'package:stettlerproapp/widgets/styled_button.dart';

import '../widgets/dimensions_pages.dart';
import '../widgets/tab_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.product,
    required this.cartProducts,
    required this.quantity,
    required this.quantityList,
    required this.totalPrice,
  });

  final Product product;
  final List<Product>? cartProducts;
  final ValueNotifier<int> quantity;
  final List<int>? quantityList;
  final ValueNotifier<double>? totalPrice;

 /* void _addToCart(context) {
    int index = cartProducts!.indexWhere((item) => item == product);

      

    if (index >= 0) {
      quantityList![index] += quantity.value;
      totalPrice!.value += product.price * quantity.value;
    } else {
      cartProducts!.add(product);
      quantityList!.add(quantity.value);
      totalPrice!.value += product.price * quantity.value;
    }

    quantity.value = 1;

    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }*/

  /*showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        'Suppression produit',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            child: Text(
              "Souhaitez vraiment supprimer ce produit du bulletin ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 100, 101, 116),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 229, 36, 36)),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
              child: Text("SUPPRIMER",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/

 /* showUpdateDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        'Mise à jour quantité',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            child: Text(
              "Vous venez de modifier la quantité de ce produit",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 100, 101, 116),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 44, 213, 111)),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
              child: Text("CONFIRMER",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
              onPressed: () => _addToCart(context),
            ),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Détail produit',
        function: CustomAppBarFunction.back,
        //additionalIcon: Icons.delete,
       // additionalFunction: () => showAlertDialog(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'REF : ${product.id}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 12,),
                        ),
                        Text(
                          'La boîte', // product[index].packaging,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 12,),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${product.price.toStringAsFixed(2)} CHF',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 229, 36, 36),
                          ),
                          margin: const EdgeInsets.all(5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            alignment: Alignment.center,
                            child: Text(
                              'Stock : ${product.quantity.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 20),
              child: Container(
                  width: displayWidth(context),
                  height: displayHeight(context) * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TapBar(product),
                      ],
                    ),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
