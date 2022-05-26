import 'package:scribble/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../models/drawnLine.dart';
import '../models/lobby.dart';

class SocketManager {
  static SocketManager? _instance;
  factory SocketManager() => _instance ??= SocketManager._();

  Socket? socket;

  SocketManager._();

  get socketId {
    return socket?.id;
  }

  void connect() {
    print("Connecting to socket ...");
    try {
      socket = io(SOCKET_URL, <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
      });
      socket?.connect();
      socket?.onConnect((_) {
        print("Connected to socket!");
      });
      socket?.onDisconnect((_) => print("Disconnected!"));
    } catch (e) {
      print(e.toString());
    }
  }

  void disconnect() {
    socket?.dispose();
  }

  void createLobby(CreateLobby data) {
    socket?.emit(EventTypes.CREATE_LOBBY, data.toJson());
  }

  void joinLobby(JoinLobby data) {
    socket?.emit(EventTypes.LOBBY_JOINED, data.toJson());
  }

  void finishDrawingLine(List<DrawnLine?> lines) {
    socket?.emit(
      EventTypes.LINE_FINISHED,
      lines
          .map(
            (line) => (line?.toJson()),
          )
          .toList(),
    );
  }
}
