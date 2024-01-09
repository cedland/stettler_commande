import 'package:flutter/material.dart';

class ProductDataClient extends StatefulWidget {
  const ProductDataClient({
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
  State<ProductDataClient> createState() => _ProductDataClientState();
}

class _ProductDataClientState extends State<ProductDataClient> {
  int _cartBadgeAmount = 0;
  final _formkey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title:  Center(
              child: Text(
                'Entrer la quantité !',
                style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
              )),
          content: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          //width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || int.parse(myController.text) ==0 || int.parse(myController.text) <0) {
                        return 'veuillez entrer la quantité du produit';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              var valeur = int.parse(myController.text);
                              print(_cartBadgeAmount);
                              setState(() {
                                _cartBadgeAmount = _cartBadgeAmount + valeur;
                                myController.clear();
                                Navigator.of(context).pop();
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 229, 36, 36),),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),),),
                          child: Text(
                            'Valider',
                            style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),
                          ),

                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),),),
                            child: Text(
                              'Annuler',
                              style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
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
                    widget.image,
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
                width: MediaQuery.of(context).size.width - 200,
                height: 90,
               // color: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    '${widget.id.toString()}',
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
                                        widget.name,
                                        style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 200,
                          height: 41,
                          //color: Colors.red,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Stock:',
                                      style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                  ),
                                  Text('${widget.quantity.toString()}',
                                      style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Container(
              width: 85,
              height: 90,
              //color: Colors.red,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 229, 36, 36),
                    ),
                    margin: const EdgeInsets.only(top:4),
                    padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                          '${widget.price.toStringAsFixed(2)} CHF',
                          style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 38,
                    icon: const Icon(Icons.add_circle),
                    color: const Color.fromARGB(255, 52, 51, 56),
                    onPressed: _showAlertDialog,
                  )
                ],
              )

            )
          ],
        ),
      ),
    );
  }
}
