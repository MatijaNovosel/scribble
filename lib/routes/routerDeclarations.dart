import 'package:go_router/go_router.dart';
import 'package:scribble/models/lobby.dart';
import 'package:scribble/pages/lobby.dart';
import 'package:scribble/pages/start.dart';
import 'package:scribble/routes/routeNames.dart';

GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.start,
        builder: (context, state) => const Start(),
      ),
      GoRoute(
        path: "/lobby",
        name: RouteNames.lobby,
        builder: (context, state) => Lobby(
          lobbyData: state.extra as LobbyCreatedResponse,
        ),
      ),
    ],
  );
}
