import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer player = AudioPlayer();
  bool playing = false;

  void _playMusic() async {
    var url =
        "https://raw.githubusercontent.com/Siarc/f_weather/master/images/Yas%20-%20Empty%20Crown%20%5BTubeRipper.com%5D.mp3";

    player.play(UrlSource(url));

    player.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        log("PlayerState.playing");
        setState(() {
          playing = true;
        });
      } else if (event == PlayerState.paused) {
        log("PlayerState.paused");
        setState(() {
          playing = false;
        });
      } else if (event == PlayerState.stopped) {
        log("PlayerState.stopped");
        setState(() {
          playing = false;
        });
      } else {
        log("PlayerState.completed");
        setState(() {
          playing = false;
        });
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () => _playMusic(),
              child: Icon(
                playing == false
                    ? Icons.play_circle_filled
                    : Icons.pause_circle_filled,
                size: 100,
                color: Colors.amber,
              ),
            ),
            WidgetCircularAnimator(
              size: 250,
              innerIconsSize: 3,
              outerIconsSize: 3,
              innerAnimation: Curves.easeInOutBack,
              outerAnimation: Curves.easeInOutBack,
              innerColor: Colors.deepPurple,
              outerColor: Colors.orangeAccent,
              innerAnimationSeconds: 10,
              outerAnimationSeconds: 10,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
                child: const Icon(
                  Icons.pedal_bike,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
