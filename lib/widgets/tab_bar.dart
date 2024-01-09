import 'package:flutter/material.dart';

import '../classes/product.dart';
class TapBar extends StatefulWidget {
  const TapBar(this.descriptionproduits, {super.key});
  final Product descriptionproduits;

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          children:[
            TabBar(
              controller: tabController,
              tabs: [
                Tab(child: Text('Informations',
                    style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                ),),
                Tab(child: Text('Ingrédients',
                    style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                ),),
              ],
              labelColor: Colors.black,
            ),
            Expanded(child: TabBarView(
              controller: tabController,
              children:  [
                Center(child: Text("À conserver au congélateur à au moins -18 °C. Une fois décongelé ne pas resurgeler et consommer sans attendre.",
              style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),)),
                Center(child: Text(widget.descriptionproduits.ingredients,
                  style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),)),
              ],

            ))
          ]
      ),
    );
  }
}