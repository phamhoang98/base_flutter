import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'index.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(EasyLocalization(
      saveLocale: false,
      startLocale: const Locale('vi'),
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
        ],
        child: GlobalLoaderOverlay(
            overlayColor: MyColor.transparent,
            overlayWidgetBuilder: (progress) {
              return const Center(
                child: LoadingApp(),
              );
            },
            child: const MyApp()),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
        // onGenerateRoute: AppPages.generateRoute,
      ),
    );
  }
}
