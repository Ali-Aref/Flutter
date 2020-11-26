import './user_model.dart';

class Message {
  final User sender;
  final String time; // now string then it will be changed
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// you current user
final User currentUser = User(
  id: 0,
  name: "Current User",
  imageUrl: "assets/images/1.jpg",
);

// other users
final User u1 = User(
  id: 1,
  name: "Neymar",
  lastname: "JR",
  imageUrl: "assets/images/a.jpg",
);
final User u2 = User(
  id: 2,
  name: "Asra",
  lastname: "Afsoon",
  imageUrl: "assets/images/2.jpg",
);
final User u3 = User(
  id: 3,
  name: "Mohsen",
  lastname: "Sharifi",
  imageUrl: "assets/images/3.jpg",
);
final User u4 = User(
  id: 4,
  name: "Orkide",
  lastname: "MHD",
  imageUrl: "assets/images/5.jpg",
);
final User u5 = User(
  id: 5,
  name: "Maro",
  lastname: "Niromand",
  imageUrl: "assets/images/6.jpg",
);
final User u6 = User(
  id: 6,
  name: "Faisal",
  lastname: "Moradi",
  imageUrl: "assets/images/7.jpg",
);
final User u7 = User(
  id: 7,
  name: "Mojtaba",
  lastname: "Rawani",
  imageUrl: "assets/images/8.jpg",
);
final User u8 = User(
  id: 8,
  name: "Mustafa",
  lastname: "Sepehr",
  imageUrl: "assets/images/9.jpg",
);
final User u9 = User(
  id: 9,
  name: "King",
  lastname: "Mokhtari",
  imageUrl: "assets/images/4.jpg",
);
final User u10 = User(
  id: 10,
  name: "Feri",
  lastname: "Madadi",
  imageUrl: "assets/images/00.jpg",
);

// fav Contacts
List<User> favContact = [u10, u2, u6, u7, u4, u3, u1];

// example resent chats on > HOME <  screen
List<Message> chats = [
  Message(
    sender: u1,
    text:
        "Some text here \n Hi, radom text (message) comes here what ever you recieve from the your contact and you can like it by touching the like icon",
    time: "2:30 pm",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: u6,
    text: "Hi How Are You? \n Some Radom text comes here what ever be on your message.",
    time: "11:20 pm",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: u4,
    text: "Hi How Are You? \n Some Radom text comes here what ever be on your message. ",
    time: "1:45 pm",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: u9,
    text: "Hi How Are You? \n Some Radom text comes here what ever be on your message.",
    time: "1:45 pm",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: u10,
    text: "Hi How Are You? \n Some Radom text comes here what ever be on your message.",
    time: "3:00 am",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: u2,
    text: "Hi How Are You? \n Some Radom text comes here what ever be on your message.",
    time: "2:30 pm",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: u4,
    text: "hi how are u ? \n Some Radom text comes here what ever be on your message.",
    time: "11:20 pm",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: u5,
    text: "Hi How Are You? \n Some Radom text comes here what ever be on your message.",
    time: "1:45 pm",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: u8,
    text: "Hi How Are You? \n Mroz kja mirafti haha otu tiz tiz",
    time: "3:00 am",
    isLiked: false,
    unread: true,
  ),
];

// example resent chats on > Chat <  screen
List<Message> messages = [
  Message(
    sender: u10,
    text: "some more messages here your/your friend messages.. :)",
    time: "3:00 am",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    text: ":| more messages here idk what to say",
    time: "1:45 pm",
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: u10,
    text: "Englishm khals shd zyad boring ast o hahah :D",
    time: "2:30 pm",
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    text: "Hey yeah IRON-MAN that was great!",
    time: "11:20 pm",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: u2,
    text: "Hey did you go for movie last night?",
    time: "2:30 pm",
    isLiked: false,
    unread: true,
  ),
];
