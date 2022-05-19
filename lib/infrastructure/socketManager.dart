import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  Socket? socket;

  void connect() {
    print("connecting ...");
    try {
      socket = io('http://10.0.2.2:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket?.connect();
      socket?.onConnect((_) {
        print("Connected to socket!");
      });
      socket?.onDisconnect((_) => print('Disconnected!'));
    } catch (e) {
      print(e.toString());
    }
  }
}
