import 'package:flutter/material.dart';
import '../../models/message_model.dart';
import '../chat_screen.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Color unReadColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(chat.sender))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: chat.unread ? unReadColor : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.only(top: 2.0, right: 10.0, bottom: 0.0, left: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(chat.sender.imageUrl),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${chat.sender.name} ${chat.sender.lastname}",
                                  style: TextStyle(
                                    fontFamily: "p052",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    chat.text,
                                    style: TextStyle(
                                      fontFamily: "p052",
                                      fontSize: 11.5,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontFamily: "MathJax",
                              ),
                            ),
                            !(chat.unread)
                                ? Text("")
                                : Container(
                                    width: 40.0,
                                    height: 20.0,
                                    margin: EdgeInsets.only(top: 15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.lightBlue,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "new",
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontFamily: "MathJax",
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
