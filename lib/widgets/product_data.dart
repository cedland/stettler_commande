import 'package:flutter/material.dart';
class ProductData extends StatelessWidget {
  const ProductData({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.price,
    required this.ingredients,
    required this.quantity
  });

  final String image;
  final String name;
  final String id;
  final double price;
  final String ingredients;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:4.0, vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width ,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                margin: EdgeInsets.all(3),
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 120,
                height: 86,
                //color: Colors.purple,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      //color: Colors.black,
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    '${id.toString()}',
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                                ),
                              ),
                              Container(
                               // color: Colors.red,
                                width: 200,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                        name,
                                        style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 229, 36, 36),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      '${price.toString()} CHF',
                                      style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.white)
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    'Stock:',
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text('${quantity.toString()}',
                                      style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
