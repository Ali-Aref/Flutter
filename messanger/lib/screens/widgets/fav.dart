import 'package:flutter/material.dart';
import '../../models/message_model.dart';
import '../chat_screen.dart';

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Favorite Contacts",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: "p052",
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                  onPressed: null)
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // padding: EdgeInsets.only(left: 10.0),
            itemCount: favContact.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(favContact[index]))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(favContact[index].imageUrl),
                      ),
                      SizedBox(height: 5.9),
                      Text(
                        favContact[index].name,
                        style: TextStyle(
                          fontFamily: "z003",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
