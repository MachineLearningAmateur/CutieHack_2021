import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Tic-Tac-Toe Demo',
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
        title: Text(
          'CutieHack2021',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business'),
            ]
      ),
    );
  }

}
