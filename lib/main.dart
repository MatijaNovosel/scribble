import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/pages/preLobby.dart';
import 'package:scribble/routes.dart';
import 'pages/drawingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final SocketManager socketManager = SocketManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: preLobby,
      routes: {
        preLobby: (context) => PreLobby(socketManager: socketManager),
        drawingPage: (context) => const DrawingPage(),
      },
      title: "Scribble",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
