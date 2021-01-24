import 'package:flutter/material.dart';
import 'package:prank/src/utils/styles.dart';

class SimpleInput extends StatelessWidget {
  final String hint;

  const SimpleInput({Key key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.black,
          ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: AppColor.grey, width: 2),
          ),
        ),
      ),
    );
  }
}
