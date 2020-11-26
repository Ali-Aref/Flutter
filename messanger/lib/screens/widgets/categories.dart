import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedindex = 0;
  final List<String> categories = ["Messages", "Groups", "Online", "Requests", "Settings"];
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
              padding: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                gradient: LinearGradient(
                  colors: <Color>[Colors.blueAccent, Colors.lightBlue],
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontFamily: "p052",
                    fontWeight: FontWeight.bold,
                    color: index == selectedindex ? Colors.black : Colors.black38,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                selectedindex = index;
              });
            },
          );
        },
      ),
    );
  }
}
