import 'package:flutter/material.dart';

class Liste extends StatefulWidget {
  const Liste({Key? key}) : super(key: key);

  @override
  State<Liste> createState() => _Truc();
}

class _Truc extends State<Liste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        title: const Center(
          child: Text("Liste à effectuer"),
        ),
      ),
    );
  }
}
