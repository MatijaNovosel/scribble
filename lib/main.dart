import 'package:go_router/go_router.dart';
import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/models/routerDeclarations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final GoRouter _router = createGoRouter();

  App({Key? key}) : super(key: key);
  final SocketManager socketManager = SocketManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Scribble',
    );
  }
}
