import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class ButtonCall extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isLocked;
  final bool selected;
  final int index;
  final void Function() ontap;

  const ButtonCall(
      {Key key,
      this.text1,
      this.text2,
      this.isLocked,
      this.selected,
      this.index,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: buildCardLocked(),
    );
  }

  AnimatedContainer buildCardLocked() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 65,
      width: Device.width,
      margin: EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected ? Color(0xffFFCE00) : Colors.white,
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(2),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected ? Color(0xffFFCE00) : Colors.white,
                      width: 1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color:
                              selected ? Color(0xffFFCE00) : Colors.transparent,
                          shape: BoxShape.circle,
                        )),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        fontSize: 16,
                        color: selected ? Color(0xffFFCE00) : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        color: selected ? Color(0xffFFCE00) : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            if (isLocked)
              SvgIcon(
                icon: "locked",
                color: Color(0xffFFCE00),
              ),
          ],
        ),
      ),
    );
  }
}
