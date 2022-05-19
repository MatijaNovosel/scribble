import 'package:flutter/material.dart';

class PreLobby extends StatefulWidget {
  const PreLobby({Key? key}) : super(key: key);

  @override
  State<PreLobby> createState() => _PreLobbyState();
}

class _PreLobbyState extends State<PreLobby> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            print("Hello");
          },
          child: const Text("Create lobby"),
        ),
      ],
    );
  }
}
