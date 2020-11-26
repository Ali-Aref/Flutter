import 'package:flutter/material.dart';
import 'package:messanger/screens/widgets/sidebarItems.dart';
import './widgets/categories.dart';
import './widgets/fav.dart';
import './widgets/chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation<Offset> _sideAnimation;
  final Duration dur = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: dur);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.75).animate(_animationController);
    _sideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashbord(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _sideAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 90.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/1.jpg"),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.445,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.blue[500], Colors.lightBlue]),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                  child: Text(
                    "\t\tAli Aref\n\tMohammadi",
                    style: TextStyle(fontSize: 17.0, fontFamily: "p052", fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                SideBarItem("DashBoard", Icons.dashboard),
                SideBarItem("Profile", Icons.person),
                SideBarItem("Friends", Icons.supervised_user_circle),
                SideBarItem("Settings", Icons.settings),
                SideBarItem("Logout", Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashbord(context) {
    return AnimatedPositioned(
      duration: dur,
      left: isCollapsed ? 0 : screenWidth * 0.385,
      right: isCollapsed ? 0 : -screenWidth * 0.4,
      top: 0,
      bottom: 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.menu),
              iconSize: 30.0,
              onPressed: () {
                setState(() {
                  if (isCollapsed)
                    _animationController.forward();
                  else
                    _animationController.reverse();
                  // isCollapsed ? _animationController.forward() : _animationController.reverse();
                  isCollapsed = !isCollapsed;
                });
              },
            ),
            title: Text(
              "Messenger",
              style: TextStyle(
                fontFamily: "p052",
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Categories(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Fav(),
                      Chats(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
