import 'package:flutter/material.dart';
import 'dart:math';
import 'package:aaproto2/ThemeData.dart';

class TLernTimerScreen extends StatefulWidget {
  @override
  _TLernTimerScreenState createState() => _TLernTimerScreenState();
}

class _TLernTimerScreenState extends State<TLernTimerScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  String get timerString {
    Duration duration =
        animationController.duration * animationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1200));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lerntimer',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  color: Theme.of(context).accentColor),
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
                                  style: Theme.of(context).textTheme.display4,
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
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (_, Widget child) {
                          return Icon(animationController.isAnimating
                              ? Icons.pause
                              : Icons.play_arrow);
                        }),
                    onPressed: () {
                      if (animationController.isAnimating) {
                        animationController.stop();
                      } else {
                        animationController.reverse(
                            from: animationController.value == 0.0
                                ? 1.0
                                : animationController.value);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
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
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * 3.14159265359;
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