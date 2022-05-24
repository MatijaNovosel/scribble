import 'package:go_router/go_router.dart';
import 'package:scribble/pages/lobby.dart';
import 'package:scribble/pages/preLobby.dart';

GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const PreLobby(),
      ),
      GoRoute(
        path: "/lobby",
        builder: (context, state) => const Lobby(),
      ),
    ],
  );
}
