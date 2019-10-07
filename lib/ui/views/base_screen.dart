// import 'package:flutter/material.dart';
// import 'package:jommalaysia/core/viewmodels/base_model.dart';
// import 'package:provider/provider.dart';

// class BaseScreen<T extends BaseModel> extends StatelessWidget {
//   final Widget Function(BuildContext context, T model, Widget child) builder;
//   BaseScreen({this.builder});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<T>(
//         builder: (context) => ChangeNotifierProvider<T>.value,
//         child: Consumer<T>(builder: builder));
//   }
// }
