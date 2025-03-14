import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: $event in Bloc: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Change: $change in Bloc: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object? error, StackTrace stackTrace) {
    super.onError(bloc, error!, stackTrace);
    print('Error: $error in Bloc: ${bloc.runtimeType}');
    print('StackTrace: $stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print('Transition: $transition in Bloc: ${bloc.runtimeType}');
  }
}
