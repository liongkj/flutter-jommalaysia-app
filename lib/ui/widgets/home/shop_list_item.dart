import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/listing.dart';

class ShopListItem extends StatelessWidget {
  ShopListItem({
    @required this.shop,
    @required this.onTap,
    // @required this.comingSoon,
    this.animationController,
    this.animation,
  });

  // final bool comingSoon;
  final Listing shop;
  final Function onTap;
  final AnimationController animationController;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    print("shop item build");
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Image.network(
                          "https://res.cloudinary.com/jomn9-com/image/upload/v1571632729/category_thumbnail/proz1gzlepy9gp3rk0ej.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        shop.listingName,
                                        textAlign: TextAlign.left,
                                        style:
                                            Theme.of(context).textTheme.subhead,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "${shop.category.category}•${shop.category.subcategory}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey
                                                    .withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.map,
                                            size: 12,
                                            color:
                                                Colors.purpleAccent, //primary
                                          ),
                                          Expanded(
                                            child: Text(
                                              "1 km to city",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16, top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "RM20",
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                  Text(
                                    "/pax",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.withOpacity(0.8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
