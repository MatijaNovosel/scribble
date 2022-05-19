import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:scribble/pages/preLobby.dart';
import 'package:scribble/routes.dart';
import 'package:scribble/store/reducer.dart';
import 'infrastructure/socketManager.dart';
import 'pages/drawingPage.dart';
import 'package:flutter/material.dart';

void main() {
  final Store<SocketManager> store = Store<SocketManager>(
    reducer,
    initialState: SocketManager(),
  );
  runApp(App(store: store));
}

class App extends StatelessWidget {
  final Store<SocketManager> store;

  App({Key? key, required this.store}) : super(key: key);
  final SocketManager socketManager = SocketManager();

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        initialRoute: preLobby,
        routes: {
          preLobby: (context) => const PreLobby(),
          drawingPage: (context) => const DrawingPage(),
        },
        title: "Scribble",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
