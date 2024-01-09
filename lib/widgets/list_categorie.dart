import 'package:flutter/material.dart';

class ListCategorie extends StatefulWidget {
  const ListCategorie({super.key});

  @override
  State<ListCategorie> createState() => _ListCategorieState();
}

class _ListCategorieState extends State<ListCategorie> {
  @override
  Widget build(BuildContext context) {
    List<String> getListItems() {
      return [
        "Apéritif",
        "Entrée",
        "Fruits et légumes",
        "Pommes de terre",
        "Pizzas & Snacking",
        "Gamme spécifique",
        "Accessoires",
        "Aides culinaires",
        "Poissons et crustacés",
      ];
    }

    return ListView.builder(
        itemCount: getListItems().length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  //fixedSize: const Size(20, 20),
                  //foregroundColor: Colors.grey,
                  //backgroundColor: Colors.yellow,
                ),
                child: Text(
                  getListItems()[index],
                    style: TextStyle(fontSize: 13, fontFamily: 'LatoRegular',color: Colors.black)
                ),
              )
            ],
          );
        });
  }
}
