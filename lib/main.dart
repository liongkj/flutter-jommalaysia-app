import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jommalaysia/ui/router.dart';
import './util/const.dart';
import './provider_setup.dart';
import 'package:provider/provider.dart';
import 'ui/shared/main_screen.dart';

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
  bool goDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: goDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: goDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'JomMalaysia',
        theme: goDark ? Constants.darkTheme : Constants.lightTheme,
        initialRoute: '/',
        //onGenerateRoute: Router.generateAndroidRoute,
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
