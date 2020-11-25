import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:happytime/models/constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Duration _duration = Duration();
  Duration _postion = Duration();
  AudioPlayer advancePlayer;
  AudioCache audioCache;
  String filepath = myMusic[0].path;
  int secc = 0;
  bool isPlay = false;
  Icon playbuttonIcon = Icon(Icons.play_arrow);

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancePlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancePlayer);

    advancePlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });
    advancePlayer.positionHandler = (p) => setState(() {
          _postion = p;
        });
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.pinkAccent,
      inactiveColor: Colors.black38,
      value: _postion.inSeconds.toDouble() != 0
          ? _postion.inSeconds.toDouble()
          : 0,
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (val) {
        setState(() {
          secc = val.toInt();
          seekToSecond(val.toInt());
        });
      },
    );
  }

  void seekToSecond(int sec) {
    Duration newDuration = Duration(seconds: sec);
    advancePlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(
          "Happytime",
          style: TextStyle(
              fontFamily: "p052", fontSize: 25, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.more_horiz), onPressed: () => about(context))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 75,
          padding: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.blueGrey[200],
            // gradient: LinearGradient(colors: <Color>[Colors.pink, Colors.pinkAccent, Colors.white70])
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.chevron_left, size: 35), onPressed: () {}),
              Container(
                width: 300,
                child: slider(),
              ),
              IconButton(
                  icon: Icon(Icons.chevron_right, size: 35), onPressed: () {}),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          if (isPlay) {
            isPlay = false;
            advancePlayer.pause();
            setState(() => playbuttonIcon = Icon(Icons.play_arrow_sharp));
          } else {
            isPlay = true;
            audioCache.play(filepath);
            setState(() => playbuttonIcon = Icon(Icons.pause));
          }
        },
        child: playbuttonIcon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Container(),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topSlider.length,
              itemBuilder: (context, i) {
                return Container(
                  width: MediaQuery.of(context).size.width - 2 * 18,
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/${topSlider[i]['img']}"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topSlider[i]["title"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "z003",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              topSlider[i]["subtitle"],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "z003",
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 225,
            bottom: 0,
            left: 0,
            right: 0,
            child: ListView.builder(
              itemCount: myMusic.length,
              itemBuilder: (context, i) {
                return Container(
                  height: 80,
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 2),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[300], Colors.grey[100]]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/img/${myMusic[i].img}"),
                      ),
                      title: Text(
                        myMusic[i].name,
                        style: TextStyle(
                          fontFamily: "p052",
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isPlay = true;
                          advancePlayer.stop();
                          filepath = myMusic[i].path;
                          audioCache.play(filepath);
                          playbuttonIcon = Icon(Icons.pause);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void about(context) {
  var alertMsg = AlertDialog(
    title: Text("About App"),
    content: Center(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage("assets/img/ali.jpg")),
          Text(
            "\nHappyTime",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "z003",
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "\nThis App is developed by Ali Aref Mohammadi for having a happy time and for learning propuse, so you can get the source code from my Github or you can watch the tutorial in youtube..\n\nFor more info please contact us\nAli Aref Mohammadi\nPhone\\WhatsApp:+93794562611\nTelegram:@aliaref2\nEmail:ali412514n@gmail.com",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "z003",
              fontSize: 17.5,
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) {
      return alertMsg;
    },
  );
}
