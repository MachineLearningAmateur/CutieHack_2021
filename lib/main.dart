import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart';

const urlPrefix = 'https://jsonplaceholder.typicode.com';

//----------------------------------------------------------------

class HomePageManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  static const urlPrefix = 'https://jsonplaceholder.typicode.com';

  Future<void> makeGetRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts');
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makePostRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts');
    final headers = {"Content-type": "application/json"};
    final json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makePutRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts/1');
    final headers = {"Content-type": "application/json"};
    final json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makePatchRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts/1');
    final headers = {"Content-type": "application/json"};
    final json = '{"title": "Hello"}';
    final response = await patch(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makeDeleteRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts/1');
    final response = await delete(url);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}

//----------------------------------------------------------------

class RequestState {
  const RequestState();
}

//----------------------------------------------------------------

class RequestInitial extends RequestState {}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.body);
  final String body;
}

class RequestLoadFailure extends RequestState {}

//------------------------------------------------------------------

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
  final stateManager = HomePageManager();

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

        //------------------------

        //-------------------------
        backgroundColor: Colors.green,
      ),

      //------------
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Wrap(
              spacing: 50,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: makeGetRequest,
                  child: Text('GET'),
                ),
                ElevatedButton(
                  onPressed: makePostRequest,
                  child: Text('POST'),
                ),
                // ElevatedButton(
                //   onPressed: stateManager.makePutRequest,
                //   child: Text('PUT'),
                // ),
                // ElevatedButton(
                //   onPressed: stateManager.makePatchRequest,
                //   child: Text('PATCH'),
                // ),
                // ElevatedButton(
                //   onPressed: stateManager.makeDeleteRequest,
                //   child: Text('DELETE'),
                // ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ValueListenableBuilder<RequestState>(
            valueListenable: ValueNotifier<RequestState>(RequestInitial()),
            builder: (context, requestState, child) {
              if (requestState is RequestLoadInProgress) {
                return CircularProgressIndicator();
              } else if (requestState is RequestLoadSuccess) {
                return Expanded(
                    child:
                        SingleChildScrollView(child: Text(requestState.body)));
              } else {
                return Container();
              }
            },
          ),
        ],
      ),

      //----------------------

      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory), label: 'Inventory'),
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes')
      ]),
    );
  }
}
