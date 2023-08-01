import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  final double size;
  const ImageLogo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Image.asset('assets/logo.png'),
    );
  }
}
