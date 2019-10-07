import 'package:flutter/material.dart';
import '../core/services/listing_service.dart';
import '../core/viewmodels/listing_item.dart';

class ListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_LISTING
            .map((x) => ListingItem(
                  x.name,
                  x.type,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
