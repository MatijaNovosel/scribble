import 'package:flutter/material.dart';
import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/utils/constants.dart';

class Lobby extends StatefulWidget {
  final String lobbyId;

  const Lobby({Key? key, required this.lobbyId}) : super(key: key);

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  get lobbyData {
    return widget.lobbyId;
  }

  @override
  void initState() {
    SocketManager().socket?.on(EventTypes.LOBBY_JOINED, (data) {
      print(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lobbyData.lobbyId,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
