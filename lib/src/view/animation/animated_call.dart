import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedCall extends StatefulWidget {
  @override
  _AnimatedCallState createState() => _AnimatedCallState();
}

class _AnimatedCallState extends State<AnimatedCall>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;

  @override
  void initState() {
    super.initState();
    initAnimation();
    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) animationController.reverse();
      if (status == AnimationStatus.dismissed) animationController.forward();
    });
  }

  initAnimation() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    Tween tween = Tween<double>(begin: 0, end: 1);
    animation1 = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 1, curve: Curves.ease),
    ));
    animation2 = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1, curve: Curves.ease),
    ));
    animation3 = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.7, 1, curve: Curves.ease),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: buildContainer(
            opacity: animation1.value,
            child: buildContainer(
              factore: 0.8,
              opacity: animation2.value,
              child: buildContainer(
                factore: 0.6,
                opacity: animation3.value,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/img.webp",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildContainer(
      {double factore = 1,
      Widget child = const SizedBox(),
      double opacity = 0}) {
    return Center(
      child: Container(
        width: 250 * factore,
        height: 250 * factore,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.white.withOpacity(opacity)),
        ),
        child: Center(child: child),
      ),
    );
  }
}
