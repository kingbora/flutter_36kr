import 'package:flutter/material.dart';

class UnderlineIndictor extends Decoration {
  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _UnderlineIndictorPainter();
  }
}

class _UnderlineIndictorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Color(0xff4394ff);
    paint.style = PaintingStyle.fill;
    final double w = 10.0;
    final double h = 2.0;
    canvas.drawRect(
      Rect.fromLTWH(
        offset.dx - w / 2 + configuration.size.width / 2,
        configuration.size.height - h - 4.0,
        w,
        h,
      ),
      paint,
    );
  }
}
