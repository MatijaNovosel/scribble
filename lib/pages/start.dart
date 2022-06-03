import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/models/lobby.dart';
import 'package:scribble/routes/routeNames.dart';
import 'package:scribble/utils/helpers.dart';
import '../utils/constants.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  final TextEditingController _lobbyNameTextFieldController = TextEditingController();
  final TextEditingController _lobbyIdTextFieldController = TextEditingController();
  final TextEditingController _lobbyPasswordTextFieldController = TextEditingController();

  String? lobbyName;
  String? lobbyId;
  String? password;

  Future<void> _showCreateLobbyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create lobby"),
          content: TextField(
            onChanged: (value) {
              setState(() {
                lobbyName = value;
              });
            },
            controller: _lobbyNameTextFieldController,
            decoration: const InputDecoration(hintText: "Lobby name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                SocketManager().createLobby(CreateLobby(
                  name: "test-lobby",
                  creatorId: SocketManager().socketId,
                  password: "password-test",
                  playerCapacity: 4,
                  roundTime: RoundTimes.veryLong,
                ));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showJoinLobbyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Join lobby"),
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    lobbyId = value;
                  });
                },
                controller: _lobbyIdTextFieldController,
                decoration: const InputDecoration(hintText: "Lobby id"),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                controller: _lobbyPasswordTextFieldController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                SocketManager().joinLobby(JoinLobby(
                  lobbyId: lobbyId,
                  password: password,
                ));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    /*
    SocketManager().connect();
    SocketManager().socket?.on(EventTypes.LOBBY_CREATED_SUCCESS, (data) {
      LobbyCreatedResponse lobbyData = LobbyCreatedResponse.fromJson(data);
      GoRouter.of(context).pushNamed(RouteNames.lobby, extra: lobbyData);
    });
    SocketManager().socket?.on(EventTypes.LOBBY_JOIN_FAILURE, (data) {
      String lobbyId = data;
      print("Failed to join lobby: $lobbyId");
    });
    */
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
            ElevatedButton(
              onPressed: () {
                _showCreateLobbyDialog(context);
              },
              child: const Text("Create lobby"),
            ),
            ElevatedButton(
              onPressed: () {
                _showJoinLobbyDialog(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.amber,
                ),
              ),
              child: const Text("Join lobby"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(RouteNames.drawingPage);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.greenAccent,
                ),
              ),
              child: const Text("Drawing page"),
            ),
            ElevatedButton(
              onPressed: () {
                showError("I'm a toast message!");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.purpleAccent,
                ),
              ),
              child: const Text("Toast test"),
            ),
          ],
        ),
      ),
    );
  }
}
