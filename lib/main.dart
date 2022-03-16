import 'package:flutter/material.dart';
import 'package:starter/home.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:starter/util/hexcolor.dart';


void main() =>  runApp(new MaterialApp(
    home: Movies()));

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        centerTitle: true,
      ),
    );
  }
}


