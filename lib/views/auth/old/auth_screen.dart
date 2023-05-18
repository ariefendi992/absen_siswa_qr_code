import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Column(
            children: [Text('A')],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    // path.quadraticBezierTo(w / 3, h - 70, w - 20, h);
    // path.quadraticBezierTo(w, h - 70, w + 20, h - 70);
    path.quadraticBezierTo(w / 2.5 - 150, h - 55, w - 350, h - 70);
    path.quadraticBezierTo(w - 75, h - 70, w - 60, h - 70);
    path.quadraticBezierTo(w, h - 90, w, h - 120);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
