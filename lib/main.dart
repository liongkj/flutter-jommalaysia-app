import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jommalaysia/core/providers/navbar_provider.dart';
import 'package:jommalaysia/ui/router.dart';
import './ui/shared/app_theme.dart';
import './provider_setup.dart';
import 'package:provider/provider.dart';

import 'ui/widgets/bottom_navigation_widget.dart';

void main() {
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'JomMalaysia',
        theme: appTheme,
        initialRoute: '/',
        home: ChangeNotifierProvider<NavBarProvider>(
          child: BottomNavBar(),
          builder: (context) => NavBarProvider(),
        ),
        onGenerateRoute: Router.generateAndroidRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
