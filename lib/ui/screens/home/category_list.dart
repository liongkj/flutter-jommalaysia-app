import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/ui/widgets/home/list_card_item.dart';

class CategoryList extends StatefulWidget {
  CategoryList({@required this.categoryList});
  final List<Category> categoryList;
  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<CategoryList> {
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            GridView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  widget.categoryList == null ? 0 : widget.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListCardItem(
                  category: widget.categoryList[index],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
