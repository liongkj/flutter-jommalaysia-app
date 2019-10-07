import 'package:flutter/material.dart';

class ListingItem extends StatelessWidget {
  final String name;
  final String type;

  ListingItem(this.name, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(name),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.withOpacity(0.7),
            Colors.green,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
