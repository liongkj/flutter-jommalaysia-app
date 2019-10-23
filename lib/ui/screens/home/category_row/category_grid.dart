import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/providers/categories_provider.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:jommalaysia/ui/widgets/home/category_card_item.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatefulWidget {
  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final TextEditingController _searchControl = TextEditingController();

  Future<void> prepareData;

  @override
  void initState() {
    prepareData =
        Provider.of<ListingsProvider>(context, listen: false).fetchListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build category grid");
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Categories"),
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
            Card(
              elevation: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Search..",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FutureBuilder(
              future: prepareData,
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting &&
                    dataSnapshot.hasData == null) {
                  return Container();
                } else {
                  final model =
                      Provider.of<CategoriesProvider>(context, listen: false);
                  final listing =
                      Provider.of<ListingsProvider>(context, listen: false);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    primary: true,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCardItem(
                        category: model.categories[index],
                        shopCount: listing
                            .getCategoryListings(model.categories[index])
                            .length,
                        items: model.getSubcategory(model.categories[index]),
                        comingSoon: model.isComingSoon(model.categories[index]),
                        onTap: () => {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.subcategoryGrid,
                            arguments: {
                              "selected": model.categories[index],
                              "subcategoryList": model.subcategories
                            },
                          )
                        },
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
