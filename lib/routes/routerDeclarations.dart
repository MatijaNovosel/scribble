import 'package:go_router/go_router.dart';
import 'package:scribble/pages/drawingPage.dart';
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
          lobbyId: state.extra as String,
        ),
      ),
      GoRoute(
        path: "/drawing-page",
        name: RouteNames.drawingPage,
        builder: (context, state) => const DrawingPage(),
      ),
    ],
  );
}
