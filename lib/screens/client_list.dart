import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/profile.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/drawer.dart';
import 'package:stettlerproapp/widgets/client_data.dart';
import 'package:stettlerproapp/data/dummy_data.dart';
import '../classes/client.dart';
import '../widgets/dimensions_pages.dart';
import '../widgets/formulaireClient/form_page.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final TextEditingController _searchController = TextEditingController();
  List<Client> filteredClients = people;

  void _selectPerson(BuildContext context, String id) {
    final singlePerson = people.firstWhere((person) => person.id == id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Profile(
          client: singlePerson,
        ),
      ),
    );
  }

  void _searchClient(String query) {
    final suggestions = people.where((client) {
      final name = client.name.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input);
    }).toList();

    setState(() => filteredClients = suggestions);
  }
  void createClient(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "Liste clients", function: CustomAppBarFunction.back, additionalIcon: Icons.add,additionalFunction: createClient,),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Column(
          children: [
            Container(
              width: displayWidth(context) *0.95,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.search, color: const Color.fromARGB(150, 124, 125, 129),),
                    SizedBox(
                      height: 50,
                      width:  displayWidth(context) *0.75,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TextFormField(
                          onChanged: _searchClient,
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Nom du client',
                            hintStyle: TextStyle(fontSize: 14, fontFamily: 'LatoLight',color: const Color.fromARGB(150, 124, 125, 129),),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: filteredClients.isNotEmpty ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredClients.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _selectPerson(
                          context, filteredClients[index].id.toString());
                      _searchController.clear();
                      setState(() {
                        filteredClients = people;
                      });
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: ClientData(
                        client: filteredClients[index]
                    ),
                  );
                },
              ):Padding(
                padding: const EdgeInsets.only(left: 10,top: 15,),
                child: Column(
                  children:  [
                    Expanded(
                        child: Text(
                          'Aucun client trouvé',
                          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: const Color.fromARGB(255, 229, 36, 36)),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
