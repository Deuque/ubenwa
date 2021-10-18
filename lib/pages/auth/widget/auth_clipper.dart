import 'package:flutter/material.dart';

class AuthClipper extends CustomClipper<Path> {
  final bool forLogin;

  AuthClipper.forLogin() : this.forLogin = true;

  AuthClipper.forSignup() : this.forLogin = false;

  @override
  Path getClip(Size size) {
    double radius = 30;
    double doubleRadius = radius * 2;
    double twoThirdRadius = radius * 2/3;
    double halfRadius = radius / 2;
    double clipCutHeight = 100;
    final path = Path();
    path.lineTo(size.width - radius, 0.0);
    path.arcToPoint(Offset(size.width, radius),
        radius: Radius.circular(radius));
    path.lineTo(size.width, size.height - radius - clipCutHeight);
    path.arcToPoint(Offset(size.width - radius, size.height - clipCutHeight),
        radius: Radius.circular(radius));
    path.lineTo((size.width / 2) + doubleRadius+(radius/5), size.height - clipCutHeight);
    path.quadraticBezierTo(
        (size.width / 2) + radius + (radius/3),
        size.height - clipCutHeight + halfRadius-(radius/3),
        (size.width / 2) + radius-(radius/5),
        size.height - clipCutHeight + radius);

    path.lineTo(size.width / 2, size.height - twoThirdRadius);
    path.quadraticBezierTo(
        (size.width / 2) -twoThirdRadius/2,
        size.height,
        (size.width / 2) - twoThirdRadius - (radius/5),
        size.height);
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height-radius),
        radius: Radius.circular(radius));
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0),
        radius: Radius.circular(radius));


    path.close();
    return path;
  }

  @override
  bool shouldReclip(AuthClipper oldClipper) => true;
}

class ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  ClipShadowPainter({required this.shadow, required this.clipper});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}