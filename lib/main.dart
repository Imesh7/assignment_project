import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_provider.dart';
import 'core/routes/app_router.dart';
import 'inject.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDNANtW2GbB0JAT6U6cJLuG7bplI4Rbi8o",
      appId: "1:814726430696:android:04b07a9f4b9e280e25ee5d",
      messagingSenderId: "",
      projectId: "assignment-project-a08e9",
    ),
      );
  runApp(MyApp());
  setup();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          title: 'Assignment Project',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ));
  }
}
