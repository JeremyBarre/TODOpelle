import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/list.dart';

class Affichage extends StatefulWidget {
  const Affichage({Key? key}) : super(key: key);

  @override
  State<Affichage> createState() => _NavigationState();
}

/// This is the private State class that goes with Affichage.
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

  void _modal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
            height: 200,
            child: Card(
              child: Column(children: const [
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tâche',
                )),
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                )),
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                )),
              ]),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        title: const Center(
          child: Text("Liste à effectuer"),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'A complétés',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archivés',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_delete),
            label: 'Supprimés',
            //backgroundColor: Colors.red,
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
        onPressed: () => _modal(context),
        icon: const Icon(Icons.add_circle),
        label: const Text("Tâche"),
      ),
    );
  }
}
