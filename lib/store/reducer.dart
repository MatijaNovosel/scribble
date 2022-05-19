import 'package:scribble/infrastructure/socketManager.dart';
import 'package:scribble/store/actions.dart';

SocketManager reducer(SocketManager previousState, dynamic action) {
  if (action == StoreActions.connect) {
    previousState.connect();
  }

  return previousState;
}
