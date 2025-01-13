import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/config/routes/routes.dart';
import 'package:provider_mvvm/config/routes/routes_name.dart';

import 'package:provider_mvvm/view_model/home/home_view_model.dart';
import 'package:provider_mvvm/view_model/login/login_view_model.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginViewModel()),
        ChangeNotifierProvider(create: (_)=>HomeViewModel() ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        // home:SplashView() ,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      )
    );
  }
}
