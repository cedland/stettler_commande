import 'package:flutter/material.dart';

class CustomRoundedLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final double minHeight;
  final double borderRadius;

  const CustomRoundedLinearProgressIndicator({
    super.key,
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
    this.minHeight = 10.0,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: minHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CustomPaint(
          painter: _ProgressBarPainter(
            value: value,
            valueColor: valueColor,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double value;
  final Color valueColor;
  final double borderRadius;

  _ProgressBarPainter({
    required this.value,
    required this.valueColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = valueColor;
    final Rect progressRect =
        Rect.fromLTRB(0, 0, size.width * value, size.height);
    final RRect roundedRect =
        RRect.fromRectAndRadius(progressRect, Radius.circular(borderRadius));
    canvas.drawRRect(roundedRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
