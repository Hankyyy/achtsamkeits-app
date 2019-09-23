import 'package:flutter/material.dart';
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

import 'UbungenUtils.dart';

enum PlayerState { stopped, playing, paused }

class UbungenPlayScreen extends StatefulWidget {
  final Ubung ubung;
  final int index;

  UbungenPlayScreen({this.ubung, this.index});

  @override
  _UbungenPlayScreenState createState() =>
      _UbungenPlayScreenState(ubung: ubung, index: index);
}

class _UbungenPlayScreenState extends State<UbungenPlayScreen>
    with TickerProviderStateMixin {
  Ubung ubung;
  int index;

  _UbungenPlayScreenState({this.ubung, this.index});

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  AnimationController animationController;

  Duration _duration;
  bool view = true;
  bool played = false;

  @override
  void initState() {
    super.initState();
    _duration = ubung.duration;
    animationController = AnimationController(vsync: this, duration: _duration)
      ..addListener(() => setState);
  }

  String get timerString {
    if (animationController.status.index == 3) played = true;
    if (animationController.value != 0)
      _duration = animationController.duration * animationController.value;
    return '${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Future loadMusic() async {
    audioPlayer = await AudioCache().play(ubung.audioPath);
  }

  @override
  void dispose() {
    audioPlayer = null;
    //audioPlayer.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ubung.title,
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 30.0,
          ),
          color: Theme.of(context).textTheme.title.color,
          tooltip: "Abbrechen",
          onPressed: () {
            audioPlayer.stop();
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: FractionallySizedBox(
                    widthFactor: 1.1,
                    child: Card(
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: AnimatedBuilder(
                                    animation: animationController,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return CustomPaint(
                                        painter: TimerPainter(
                                            animation: animationController,
                                            backgroundColor: Theme.of(context)
                                                .highlightColor,
                                            color:
                                                Theme.of(context).primaryColor),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: AnimatedBuilder(
                                    animation: animationController,
                                    builder: (_, Widget child) {
                                      return Text(
                                        timerString,
                                        style: TextStyle(fontSize: 60.0),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: 2,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: AnimatedBuilder(
                          animation: animationController,
                          builder: (_, Widget child) {
                            return Icon(
                              animationController.isAnimating
                                  ? Icons.pause
                                  : played ? Icons.refresh : Icons.play_arrow,
                              color:
                                  Theme.of(context).accentTextTheme.title.color,
                            );
                          }),
                      onPressed: () {
                        if (animationController.isAnimating) {
                          setState(
                            () {
                              audioPlayer.pause();
                              animationController.stop();
                            },
                          );
                        } else if (animationController.status.index == 3) {
                        } else {
                          setState(
                            () {
                              if (played == false) {
                                loadMusic();
                                played = true;
                              } else
                                audioPlayer.resume();
                              animationController.reverse(
                                  from: animationController.value == 0.0
                                      ? 1.0
                                      : animationController.value);
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData getIcon(int i) {
    switch (i) {
      case 2:
        return Icons.pause;
        break;
      case 3:
        return Icons.refresh;
        break;
    }
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;

  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 17.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * -3.14159265359;
    canvas.drawArc(
        Offset.zero & size, 3.14159265359 * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
