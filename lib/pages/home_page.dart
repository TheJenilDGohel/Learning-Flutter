import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "Jenil D Gohel";
    return Scaffold(
      appBar: AppBar(
        title: Text("This Is A Title"),
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Container(
          child: Text("Hey YA Bro !! $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
