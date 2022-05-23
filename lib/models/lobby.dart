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
}
