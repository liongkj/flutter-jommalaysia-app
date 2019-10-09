import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Function onTap;

  const CategoryItem({@required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 3.0,
                    offset: Offset(0.0, 2.0),
                    color: Color.fromARGB(80, 0, 0, 0))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                category.categoryName,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
              ),
              Text(category.categoryNameMs,
                  maxLines: 2, overflow: TextOverflow.ellipsis)
            ],
          ),
        ),
      ),
    );
  }
}
