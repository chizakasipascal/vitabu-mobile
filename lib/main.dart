import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/bloc/emprunt/emprunt_bloc.dart';
import 'src/bloc/scan/scan_bloc.dart';

/// Obeserver d'état des blocs dans l'application
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    debugPrint('Main.SimpleBlocObserver.OnEvent ::: EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(
        'Main.SimpleBlocObserver.OnTransition ::: TRANSITION: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    debugPrint('Main.SimpleBlocObserver.OnError ::: '
        'ERROR: $error & STACKTRACE: $stackTrace');
  }
}

void main() async {
  try {
    /// Initialisation du l'observer
    Bloc.observer = SimpleBlocObserver();

    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ScanBloc>(
            create: (context) => ScanBloc(),
          ),
          BlocProvider<EmpruntBloc>(
            create: (context) => EmpruntBloc(),
          ),
        ],
        child: VitabuApp(),
      ),
    );
  } catch (error, stacktrace) {
    debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
  }
}
