import 'package:asistensunnahbloc/pages/Authentication/login/loginUI.dart';
import 'package:asistensunnahbloc/pages/Authentication/login/registerUI.dart';
import 'package:asistensunnahbloc/pages/Authentication/login/verifyUI.dart';
import 'package:asistensunnahbloc/pages/Authentication/login/welcomeUI.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class LoginRoutes {
  static const String loginRoot = 'logIn/';
  static const String register = 'registerUI';
  static const String verification = 'verification';
  static const String welcome = 'welcomeUI';
}

class LoginNavigator extends StatelessWidget {
  const LoginNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => const LoginUI();
              break;
            case LoginRoutes.register:
              builder = (BuildContext _) => const RegisterUI();
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => const VerifyUI();
              break;
            case LoginRoutes.welcome:
              builder = (BuildContext _) => WelcomeUI(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, PageRoutes.bottomNavigation);
                    },
                  );
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
