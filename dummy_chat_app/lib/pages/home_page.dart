import 'package:flutter/material.dart';
import 'chatscreen_page.dart';
class HomePage extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dummy Chat Application'),
      ),
      body: new ChatScreenPage(),
    );
  }
}
