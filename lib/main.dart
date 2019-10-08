import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jommalaysia/core/viewmodels/home_viewmodel.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'JomMalaysia',
        theme: appTheme,
        initialRoute: '/',
        home: ChangeNotifierProvider<HomeViewModel>(
          child: BottomNavBar(),
          builder: (context) => HomeViewModel(),
        ),
        onGenerateRoute: Router.generateAndroidRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
