import 'dart:async';
import 'dart:developer';

import 'package:arch_design/app/bloc/app/app_bloc.dart';
import 'package:arch_design/app/view/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:http_manager/http_manager.dart';

/// Custom instance of [BlocObserver] which logs
/// any state changes and errors.
class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    // FirebaseCrashlytics.instance.recordError(
    //   error,
    //   stackTrace,
    //   fatal: true,
    //   reason: '$bloc throws error',
    // );
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  // repository provider is used here to provide all the repositories
  // Bloc is always kept just above the widget which is dependent on it.
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      // firebase crashlytics configuration
      // await FirebaseCrashlytics.instance
      //     .setCrashlyticsCollectionEnabled(kReleaseMode);
      // FlutterError.onError =
      //     FirebaseCrashlytics.instance.recordFlutterFatalError;

      return runApp(

          /// Providing top level bloc, which is generally the auth
          /// bloc which shares user data to the application.
          ///
          MultiRepositoryProvider(
              providers: [
                RepositoryProvider.value(value: HttpManager())
              ],
              child: BlocProvider(
                create: (context) => AppBloc(
                  homeRepo: HomeTempRepo(
                    homeDemoData: DummyHomeData(httpManager: HttpManager()),
                  ),
                ),
                child: const App(),
              ))
          // BlocProvider(
          //   create: (context) => AppBloc(
          //     homeRepo: HomeTempRepo(
          //       homeDemoData:
          //           DummyHomeData(httpManager: HttpManager()),
          //     ),
          //   ),
          //   child: const App(),
          // ),
          );
    },
    // firebase logging should be here as well
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
