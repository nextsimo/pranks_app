import 'package:flutter/material.dart';
import 'package:prank/src/utils/styles.dart';

class MainButton extends StatelessWidget {
  final Function ontap;
  final String label;

  const MainButton({Key key, this.ontap, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColor.black,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
