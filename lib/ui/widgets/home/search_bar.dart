import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required TextEditingController searchControl,
  })  : _searchControl = searchControl,
        super(key: key);

  final TextEditingController _searchControl;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
