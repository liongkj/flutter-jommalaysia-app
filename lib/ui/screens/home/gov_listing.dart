import 'package:flutter/material.dart';
import 'package:jommalaysia/util/categories.dart';

class GovListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Government",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          FlatButton(
            child: Text(
              "See all (9)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
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

      //Horizontal List here
      Container(
        height: MediaQuery.of(context).size.height / 6,
        child: ListView.builder(
          primary: false,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories == null ? 0 : categories.length,
          itemBuilder: (BuildContext context, int index) {
            Map cat = categories[index];

            return Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      cat["img"],
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.2, 0.7],
                          colors: [
                            cat['color1'],
                            cat['color2'],
                          ],
                          // stops: [0.0, 0.1],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.height / 6,
                        padding: EdgeInsets.all(1),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            cat["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
