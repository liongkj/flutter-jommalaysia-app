import 'package:flutter/material.dart';
import 'package:jommalaysia/util/restaurants.dart';

class ListingOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              restaurants[0]["title"],
            ),
            Text(
              restaurants[0]["address"],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.directions),
                        SizedBox(width: 8.0),
                        Text("Direction"),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                FlatButton(
                  color: Colors.white,
                  textColor: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.phone),
                        SizedBox(width: 8.0),
                        Text("Call"),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
