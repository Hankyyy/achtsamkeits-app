import 'package:flutter/material.dart';

import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'dart:math';
import 'package:aaproto2/ThemeData.dart';

class LernTimerScreen extends StatefulWidget {
  @override
  _LernTimerScreenState createState() => _LernTimerScreenState();
}

class _LernTimerScreenState extends State<LernTimerScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Duration _duration = Duration(
    hours: 0,
    minutes: 45,
  );
  Duration _newDuration = Duration(
    hours: 0,
    minutes: 45,
  );
  bool i = true;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: _duration);
  }

  String get timerString {
    if (animationController.value != 0)
      _duration = animationController.duration * animationController.value;
    return '${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Widget swapTimer(context) {
      if (!i)
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: DurationPicker(
              height: 400,
              width: 400,
              duration: _duration,
              onChange: (val) {
                setState(() {
                  _duration = val;
                });
              },
              snapToMins: 5.0,
            )),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),

                    onPressed: () {
                      setState(() {
                        animationController.duration = _duration;
                        i = true;
                      });
                    },
                    backgroundColor: AAThemeData.buttonColor,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          ],
        );
      else
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                              painter: TimerPainter(
                                  animation: animationController,
                                  backgroundColor: Colors.white,
                                  color: AAThemeData.primaryColor),
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
                              }))
                    ],
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
                    backgroundColor: AAThemeData.primaryColor,
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (_, Widget child) {
                          return Icon(
                            animationController.isAnimating
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                          );
                        }),
                    onPressed: () {
                      if (animationController.isAnimating) {
                        setState(() {
                          animationController.stop();
                        });
                      } else {
                        setState(() {
                          animationController.reverse(
                              from: animationController.value == 0.0
                                  ? 1.0
                                  : animationController.value);
                        });
                      }
                    },
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  FloatingActionButton(
                    heroTag: 3,
                    child: Icon(
                      Icons.edit,
                      color: AAThemeData.primaryColor,
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        //_duration = Duration(minutes: 0);
                        i = false;
                        animationController.reset();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lerntimer',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){Navigator.pop(context);}),
      ),
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: swapTimer(context),
      ),
    );
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
