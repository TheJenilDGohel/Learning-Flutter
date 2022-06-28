import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "Jenil D Gohel";
    return Scaffold(
      appBar: AppBar(
        title: Text("This Is A Title"),
        shadowColor: Colors.black,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          child: Text("Hey YA !! $name"),
        ),
      ),
      drawer: Drawer(backgroundColor: Colors.purpleAccent),
    );
  }
}
