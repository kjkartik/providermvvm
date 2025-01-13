import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm/config/routes/routes_name.dart';
import 'package:provider_mvvm/view/login/login_view.dart';

import '../../view/home/home_view.dart';
import '../../view/splash/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>  LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
