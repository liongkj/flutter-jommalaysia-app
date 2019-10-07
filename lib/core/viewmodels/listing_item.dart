import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';

class ListingItem extends StatelessWidget {
  final String id;
  final String name;
  final String type;

  ListingItem(this.id, this.name, this.type);

  void getListingDetail(BuildContext context) {
    Navigator.of(context).pushNamed(RoutePaths.LISTINGINFO, arguments: {
      'id': id,
      'name': name,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getListingDetail(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          name,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
