import 'package:socket_io_client/socket_io_client.dart';

import '../models/lobby.dart';

class SocketManager {
  late Socket socket;

  get socketId {
    return socket.id;
  }

  void connect() {
    print("Connecting ...");
    try {
      socket = io("http://10.0.2.2:3000", <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
      });
      socket.connect();
      socket.onConnect((_) {
        print("Connected to socket!");
      });
      socket.onDisconnect((_) => print('Disconnected!'));
    } catch (e) {
      print(e.toString());
    }
  }

  void createLobby(CreateLobby data) {
    socket.emit("create-lobby", data);
  }
}
