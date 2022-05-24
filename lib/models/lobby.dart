class CreateLobby {
  String name;
  String creatorId;
  String password;
  int playerCapacity;
  int roundTime; // Seconds

  CreateLobby({
    required this.name,
    required this.creatorId,
    required this.password,
    required this.playerCapacity,
    required this.roundTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'creatorId': creatorId,
      'password': password,
      'playerCapacity': playerCapacity,
      'roundTime': roundTime,
    };
  }
}

class LobbyCreatedResponse {
  String socketId;
  String lobbyId;

  LobbyCreatedResponse({
    required this.socketId,
    required this.lobbyId,
  });

  @override
  String toString() {
    return "$socketId -> $lobbyId";
  }

  LobbyCreatedResponse.fromJson(Map<String, dynamic> json)
      : socketId = json["socketId"],
        lobbyId = json["lobbyId"];
}
