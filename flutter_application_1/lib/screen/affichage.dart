import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/list.dart';

final List<Map<String, dynamic>> list = [
  {"Tache": "lol", "Date": 02 - 11 - 2020, "Description": "ça marche"}
];

class Affichage extends StatefulWidget {
  final List<Map<String, dynamic>> task;
  const Affichage({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<Affichage> createState() => _NavigationState();
}

class _NavigationState extends State<Affichage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: A complétés',
      style: optionStyle,
    ),
    Text(
      'Index 1: Busness',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _modal(BuildContext context, Map<String, dynamic> list) =>
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 300,
                  child: Card(
                    child: Column(children: [
                      const TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tâche',
                      )),
                      const TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      )),
                      const TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      )),
                      // ElevatedButton(
                      //   onPressed: () => _modal(context),
                      //   child: const Text('Save'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () => _modal(context),
                      //   child: const Text('Return'),
                      // ),
                    ]),
                  ),
                ),
              ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Liste à effectuer"),
        ),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(list[index]["Tache"]),
                onTap: () => _modal(context, list[index]),
              ),
            );
          }),
      //Center(
      // child: _widgetOptions.elementAt(_selectedIndex),
      //),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'A complétés',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archivés',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_delete),
            label: 'Supprimés',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue[600],
        onTap: _onItemTapped,
        //onTap: (values) => Navigator.push(
        //    context, MaterialPageRoute(builder: (context) => Liste()))
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_circle),
        label: const Text("Tâche"),
      ),
    );
  }
}
