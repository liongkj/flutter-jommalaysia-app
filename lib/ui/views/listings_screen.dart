import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/widgets/ListingsWidget.dart';

class ListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: ListingsWidget(),
    );
  }
}
