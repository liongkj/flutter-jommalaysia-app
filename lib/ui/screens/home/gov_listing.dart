import 'package:flutter/material.dart';
import 'package:jommalaysia/util/friends.dart';

class GovListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Friends",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            FlatButton(
              child: Text(
                "See all (59)",
                style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return DishesScreen();
//                        },
//                      ),
//                    );
              },
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          height: 50.0,
          child: ListView.builder(
            primary: false,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: friends == null ? 0 : friends.length,
            itemBuilder: (BuildContext context, int index) {
              String img = friends[index];

              return Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    img,
                  ),
                  radius: 25.0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
