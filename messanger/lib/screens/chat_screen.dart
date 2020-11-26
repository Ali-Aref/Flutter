import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen(this.user);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          margin: isMe
              ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: MediaQuery.of(context).size.width * 0.35)
              : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 0.0),
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).primaryColor : Colors.grey[300],
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message.text,
                style: TextStyle(
                  fontFamily: "p052",
                  wordSpacing: 2.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
        !isMe
            ? IconButton(
                icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                color: message.isLiked ? Colors.red : Colors.black,
                onPressed: () {},
              )
            : SizedBox.shrink(),
      ],
    );
  }

  _buildMessageComposser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 60,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            color: Theme.of(context).primaryColor,
            iconSize: 30.0,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              onChanged: (_) {},
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: "Send a message...",
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "${widget.user.name} ${widget.user.lastname}",
          style: TextStyle(
            fontFamily: "p052",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: null,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final Message msg = messages[index];
                        final bool isMe = msg.sender.id == currentUser.id;
                        return _buildMessage(msg, isMe);
                      },
                    ),
                  ),
                ),
              ),
            ),
            _buildMessageComposser(),
          ],
        ),
      ),
    );
  }
}
