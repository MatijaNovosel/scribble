import 'package:flutter/material.dart';

class PreLobby extends StatefulWidget {
  const PreLobby({Key? key}) : super(key: key);

  @override
  State<PreLobby> createState() => _PreLobbyState();
}

class _PreLobbyState extends State<PreLobby> {
  final TextEditingController _lobbyNameTextFieldController = TextEditingController();
  String? lobbyName;

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
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  setState(() {
                    // socket.createLobby(CreateLobby(
                    //   name: "test-lobby",
                    //   creatorId: widget.socketManager.socketId,
                    //   password: "password-test",
                    //   playerCapacity: 4,
                    //   roundTime: RoundTimes.veryLong,
                    // ));
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    // socket.connect();
    // socket.socket.on("lobby-created-success", (data) {
    //   LobbyCreatedResponse lobbyData = LobbyCreatedResponse.fromJson(data);
    //   //
    // });
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
                //
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.amber,
                ),
              ),
              child: const Text("Join lobby"),
            ),
          ],
        ),
      ),
    );
  }
}
