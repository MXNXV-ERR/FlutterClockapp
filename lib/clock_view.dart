import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width / 2;
    var y = size.height / 2;
    var c = Offset(x, y);
    var r = min(x, y);

    var fillBrush = Paint()..color = Color(0xff4444974);
    var outlineBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centerBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var minBrush = Paint()
      ..shader =
          RadialGradient(colors: [Colors.lightBlueAccent, Colors.pinkAccent])
              .createShader(Rect.fromCircle(center: c, radius: r))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    var hrBrush = Paint()
      ..shader =
          RadialGradient(colors: [Colors.lightBlueAccent, Colors.pinkAccent])
              .createShader(Rect.fromCircle(center: c, radius: r))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;
    var secBrush = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(c, r - 20, fillBrush);
    canvas.drawCircle(c, r - 20, outlineBrush);
    var hrHandx =
        x + 30 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hrHandy =
        x + 30 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawLine(c, Offset(hrHandx, hrHandy), hrBrush);
    var minHandx = x + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandy = x + 80 * sin(dateTime.minute * 6 * pi / 180);

    canvas.drawLine(c, Offset(minHandx, minHandy), minBrush);

    var secHandx = x + 90 * cos(dateTime.second * 6 * pi / 180);
    var secHandy = x + 90 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(c, Offset(secHandx, secHandy), secBrush);

    canvas.drawCircle(c, 8, centerBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
