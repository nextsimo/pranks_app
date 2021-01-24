import 'package:flutter/material.dart';

class ProfilAvatar extends StatelessWidget {
  final double size;

  const ProfilAvatar({Key key, this.size = 78}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "profilavatar",
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
          border: Border.all(color: Colors.white),
          image: DecorationImage(
            image: AssetImage("assets/profil.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
