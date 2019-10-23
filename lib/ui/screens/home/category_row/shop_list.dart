import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:jommalaysia/ui/widgets/home/search_bar.dart';
import 'package:jommalaysia/ui/widgets/home/shop_list_item.dart';
import 'package:provider/provider.dart';

class ShopList extends StatefulWidget {
  ShopList({@required this.selected});

  final Category selected;
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> with TickerProviderStateMixin {
  final TextEditingController _searchControl = TextEditingController();
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Shops"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SearchBar(
              searchControl: _searchControl,
            ),
            SizedBox(height: 10.0),

            ShopListItem(
              shop: Provider.of<ListingsProvider>(context)
                  .getSubcategoryListings(widget.selected)[0],
              animationController: animationController,
              animation: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animationController,
                  curve:
                      Interval((1 / 1) * 1, 1.0, curve: Curves.fastOutSlowIn),
                ),
              ),
            ),
            // Consumer<ListingsProvider>(
            //   builder: (_, model, child) => ListView.builder(
            //     itemCount: model.getSubcategoryListings(widget.selected).length,
            //     padding: EdgeInsets.only(top: 8),
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (context, index) {
            //       var count =
            //           model.getSubcategoryListings(widget.selected).length > 10
            //               ? 10
            //               : model
            //                   .getSubcategoryListings(widget.selected)
            //                   .length;
            //       var animation = Tween(begin: 0.0, end: 1.0).animate(
            //           CurvedAnimation(
            //               parent: animationController,
            //               curve: Interval((1 / count) * index, 1.0,
            //                   curve: Curves.fastOutSlowIn)));
            //       animationController.forward();
            //       return ShopListItem(
            //         shop: model.getSubcategoryListings(widget.selected)[index],
            //         animation: animation,
            //         animationController: animationController,
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
