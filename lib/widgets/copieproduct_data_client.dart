import 'package:flutter/material.dart';

class ProductDataClient extends StatefulWidget {
  const ProductDataClient({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.price,
    required this.ingredients,
  });

  final String image;
  final String name;
  final String id;
  final double price;
  final String ingredients;

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
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: widget.id,
                child: Image.asset(widget.image, fit: BoxFit.cover,),
              ),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.name,
                      style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Ref : ${widget.id}',
                      style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 229, 36, 36),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.price.toStringAsFixed(2)} CHF',
                        style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.add_circle),
                    color: const Color.fromARGB(255, 52, 51, 56),
                    onPressed: _showAlertDialog,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
