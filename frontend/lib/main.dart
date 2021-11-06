import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized(); //Ensure plugin services are initialized
  final cameras = await availableCameras(); //Get list of available cameras
  runApp(MyApp(cameras:cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'CutieHack_2021',
        debugShowCheckedModeBanner: false
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  static const TextStyle styleChoice = TextStyle(fontSize: 30, fontWeight:  FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Inventory',
      style: styleChoice,
      ),
      Text(
        'Index 1: Camera',
        style: styleChoice,
      ),
      Text('Index 2: Recipes',
      style: styleChoice
      ),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
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
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory), 
            label: 'Inventory'),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), 
            label: 'Recipes')
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key, required List<CameraDescription> cameras }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int selectedCamera = 0; //default camera choice 
  List<File> capturedImages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}