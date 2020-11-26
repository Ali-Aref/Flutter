import 'package:flutter/material.dart';

class SideBarItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function action;

  SideBarItem(this.name, this.icon, {this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.455,
      padding: EdgeInsets.all(9.0),
      margin: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue[500], Colors.lightBlue]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 10.0),
          Text(
            name,
            style: TextStyle(
              fontFamily: "p052",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
