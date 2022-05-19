import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/store/actions.dart';

class PreLobby extends StatefulWidget {
  const PreLobby({Key? key}) : super(key: key);

  @override
  State<PreLobby> createState() => _PreLobbyState();
}

class _PreLobbyState extends State<PreLobby> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<SocketManager, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(StoreActions.connect);
      },
      builder: (context, callback) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: callback,
              child: const Text("Connect"),
            ),
          ],
        );
      },
    );
  }
}
