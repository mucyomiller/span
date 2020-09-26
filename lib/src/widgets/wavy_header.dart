import 'package:flutter/material.dart';

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _dsize = MediaQuery.of(context).size.shortestSide;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return ClipPath(
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight + 12),
        width: double.infinity,
        height: _dsize * 0.70,
        alignment: Alignment.topCenter,
        color: Theme.of(context).primaryColor,
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    // path.arcTo(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 1.5), radius: 60),
    //     2.1,
    //     50,
    //     false);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
