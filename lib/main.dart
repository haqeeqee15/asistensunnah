import 'package:asistensunnahbloc/pages/Authentication/login/loginUI.dart';
import 'package:asistensunnahbloc/pages/Authentication/login/registerUI.dart';
// import 'package:asistensunnahbloc/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_config/theme_cubit.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..getCurrentTheme(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
            return MaterialApp(
              theme: theme,
              home: const LoginUI(),
              routes: PageRoutes().routes(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
    
  }
}