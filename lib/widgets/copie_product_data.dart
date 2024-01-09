import 'package:flutter/material.dart';

class ProductData extends StatelessWidget {
  const ProductData({
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
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
                tag: id,
                child: Image.network(image),
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
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Ref : $id',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(150, 124, 125, 129),
                        fontSize: 12),
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
                      '${price.toStringAsFixed(2)} CHF',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white, fontSize: 14),
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
                    onPressed: () {},
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
