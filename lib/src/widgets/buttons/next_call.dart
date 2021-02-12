import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';

class Next extends StatelessWidget {
  final Function function;

  const Next({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: function,
        child: Container(
          width: Device.width * 0.16,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xffFFCE00),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Image.asset(
              "assets/arrow_next.png",
            ),
          ),
        ),
      ),
    );
  }
}
