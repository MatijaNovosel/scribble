import 'package:scribble/pages/preLobby.dart';
import 'package:scribble/routes.dart';
import 'infrastructure/socketManager.dart';
import 'pages/drawingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SocketManager socketManager = SocketManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: preLobby,
      routes: {preLobby: (context) => const PreLobby(), drawingPage: (context) => const DrawingPage()},
      title: "Scribble",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
