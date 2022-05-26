// ignore_for_file: constant_identifier_names

const SOCKET_URL = "http://10.0.2.2:3000";

class RoundTimes {
  static const veryShort = 10;
  static const short = 20;
  static const medium = 30;
  static const mediumLong = 40;
  static const long = 50;
  static const veryLong = 60;
}

class EventTypes {
  // User
  static const INVALID_USER_ID = "invalid-user-id";
  // Lobby
  static const LOBBY_JOINED = "lobby-joined";
  static const LOBBY_LEFT = "lobby-left";
  static const CREATE_LOBBY = "create-lobby";
  static const LOBBY_JOIN_FAILURE = "lobby-join-failure";
  static const LOBBY_CREATED_SUCCESS = "lobby-created-success";
  static const PLAYER_LEFT = "player-left";
  static const INVALID_LOBBY_ID = "invalid-lobby-id";
  // General
  static const DISCONNECTED = "disconnected";
  static const USER_CUSTOMIZED = "user-customized";
  // Drawing
  static const LINE_FINISHED = "line-finished";
  static const UPDATE_CANVAS = "update-canvas";
}
