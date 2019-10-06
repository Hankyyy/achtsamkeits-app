import 'package:flutter/material.dart';

import 'package:flutter_duration_picker/flutter_duration_picker.dart';

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

  bool view = true;

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

  Widget swapWidget() {
    if (!view)
      return pickerWidget();
    else
      return timerWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lerntimer',
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
            animationController.dispose();
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
          child: swapWidget(),
        ),
      ),
    );
  }

  Widget timerWidget() {
    return Column(
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
                            builder: (BuildContext context, Widget child) {
                              return CustomPaint(
                                painter: TimerPainter(
                                    animation: animationController,
                                    backgroundColor:
                                        Theme.of(context).highlightColor,
                                    color: Theme.of(context).primaryColor),
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
                          : Icons.play_arrow,
                      color: Theme.of(context).accentTextTheme.title.color,
                    );
                  },
                ),
                onPressed: () {
                  if (animationController.isAnimating) {
                    setState(() {
                      animationController.stop();
                    });
                  } else {
                    setState(
                      () {
                        animationController.reverse(
                            from: animationController.value == 0.0
                                ? 1.0
                                : animationController.value);
                      },
                    );
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
                  color: Theme.of(context).textTheme.title.color,
                ),
                backgroundColor: Theme.of(context).accentTextTheme.title.color,
                onPressed: () {
                  setState(
                    () {
                      //_duration = Duration(minutes: 0);
                      view = false;
                      animationController.reset();
                      //swapWidget = PickerWidget();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget pickerWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: FractionallySizedBox(
            widthFactor: 1.1,
            child: Card(
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(75),
                child: DurationPicker(
                  duration: _duration,
                  onChange: (val) {
                    setState(
                      () {
                        _duration = val;
                      },
                    );
                  },
                  snapToMins: 5.0,
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
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).accentTextTheme.title.color,
                ),
                onPressed: () {
                  setState(
                    () {
                      animationController.duration = _duration;
                      view = true;
                      //swapWidget = TimerWidget();
                    },
                  );
                },
                backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ],
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
