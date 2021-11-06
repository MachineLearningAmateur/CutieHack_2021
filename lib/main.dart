import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'CutieHack_2021',
        debugShowCheckedModeBanner: false,
        home: Center(
          child: Menu(),
        ));
  }
}

class States {
  //there can only be three kinds of states: x, o, and empty for each slot of the gameboard
  static const empty = '';
  static const X = 'X';
  static const O = 'O';
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  static final length = 3;
  static final double wl = 125;

  @override
  void initState() {
    super.initState();
 
  }


  void tap() {}

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CutieHack2021',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory), 
            label: 'Inventory'),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), 
            label: 'Recipes')
            ]
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  const CameraApp({ Key? key }) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}