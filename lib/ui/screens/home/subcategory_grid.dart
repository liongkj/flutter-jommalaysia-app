import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:jommalaysia/ui/widgets/base_change_notifier.dart';
import 'package:jommalaysia/ui/widgets/home/subcategory_card_item.dart';
import 'package:provider/provider.dart';

class SubcategoryGrid extends StatefulWidget {
  SubcategoryGrid({@required this.subcategoryList, @required this.selected});
  final List<Category> subcategoryList;
  final Category selected;
  @override
  _SubcategoryGridState createState() => _SubcategoryGridState();
}

class _SubcategoryGridState extends State<SubcategoryGrid> {
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final subcategoryList = widget.subcategoryList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Subcategories"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BaseChangeNotifier<ListingsProvider>(
        model: Provider.of<ListingsProvider>(context),
        onModelReady: (model) => model.fetchListings(widget.selected),
        builder: (context, model, child) => Padding(
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
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: subcategoryList == null ? 0 : subcategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubcategoryCardItem(
                      subcategory: subcategoryList[index],
                      listings: model.getListings(subcategoryList[index]),
                      comingSoon: model.isComingSoon(subcategoryList[index]),
                      onTap: () {
                        print("tap subcategoryitem");
                        Navigator.pushNamed(
                          context,
                          RoutePaths.categoryGrid,

                          // arguments: model.categoryList,
                        );
                      });
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
