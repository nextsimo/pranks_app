import 'package:flutter/material.dart';
import 'package:prank/src/utils/styles.dart';

class MainButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.black,
      ),
      child: Center(
        child: Text(
          'Sign in',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
