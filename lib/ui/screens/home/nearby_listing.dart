import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/screens/search/trending.dart';
import 'package:jommalaysia/ui/widgets/slide_item.dart';
import 'package:jommalaysia/util/restaurants.dart';

class NearbyListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Near You",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            FlatButton(
              child: Text(
                "See all (43)",
                style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Trending();
                    },
                  ),
                );
              },
            ),
          ],
        ),

        SizedBox(height: 10.0),

        //Horizontal List here
        Container(
          height: MediaQuery.of(context).size.height / 2.4,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: restaurants == null ? 0 : restaurants.length,
            itemBuilder: (BuildContext context, int index) {
              Map restaurant = restaurants[index];

              return Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: SlideItem(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
