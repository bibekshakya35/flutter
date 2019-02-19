import 'package:flutter/material.dart';
import 'pages/home_page.dart';
void main() => runApp(new DummyChatApp());

class DummyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Chat Application',
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}