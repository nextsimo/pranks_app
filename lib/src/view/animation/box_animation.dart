import 'package:flutter/material.dart';

class BoxAnimation extends StatefulWidget {
  @override
  _BoxAnimationState createState() => _BoxAnimationState();
}

class _BoxAnimationState extends State<BoxAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    animationController.forward();
  }

  initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    animation = Tween<double>(begin: 1, end: 0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(20 * animation.value, -30 * animation.value),
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
