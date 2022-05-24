import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/pages/preLobby.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Scribble",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final SocketManager socketManager = SocketManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              "Scribble",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: PreLobby(
        socketManager: socketManager,
      ),
    );
  }
}
