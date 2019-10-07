import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/router.dart';
import './ui/shared/app_theme.dart';
import './provider_setup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
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
        onGenerateRoute: Router.generateAndroidRoute,
      ),
    );
  }
}
