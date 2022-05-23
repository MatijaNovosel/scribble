import 'package:flutter/material.dart';
import 'package:scribble/constants.dart';
import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/models/lobby.dart';

class PreLobby extends StatefulWidget {
  final SocketManager socketManager;

  const PreLobby({Key? key, required this.socketManager}) : super(key: key);

  @override
  State<PreLobby> createState() => _PreLobbyState();
}

class _PreLobbyState extends State<PreLobby> {
  get socket {
    return widget.socketManager;
  }

  @override
  void initState() {
    socket.connect();
    socket.socket.on("lobby-created-success", (data) {
      print(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            socket.createLobby(CreateLobby(
              name: "test-lobby",
              creatorId: widget.socketManager.socketId,
              password: "password-test",
              playerCapacity: 4,
              roundTime: RoundTimes.veryLong,
            ));
          },
          child: const Text("Create lobby"),
        ),
      ],
    );
  }
}
