import 'package:flutter/material.dart';
import 'package:scribble/infrastructure/socketManager.dart';

class PreLobby extends StatefulWidget {
  final SocketManager socketManager;

  const PreLobby({Key? key, required this.socketManager}) : super(key: key);

  @override
  State<PreLobby> createState() => _PreLobbyState();
}

class _PreLobbyState extends State<PreLobby> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.socketManager.connect();
            widget.socketManager.socket?.on("hello", (data) {
              print("Hell");
              print(data);
            });
          },
          child: const Text("Connect"),
        ),
      ],
    );
  }
}
