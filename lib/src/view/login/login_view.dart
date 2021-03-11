import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/styles.dart';
import 'package:prank/src/view/login/login_view_model.dart';
import 'package:prank/src/widgets/buttons/main_button.dart';
import 'package:prank/src/widgets/inputs/simple_input.dart';
import 'package:prank/src/widgets/more/custom_divider.dart';
import 'package:prank/src/widgets/more/social_icon.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Device.init(context);
    return Material(
      child: ChangeNotifierProvider<LoginViewModel>(
        create: (_) => LoginViewModel(),
        builder: (BuildContext context, __) {
          LoginViewModel model =
              Provider.of<LoginViewModel>(context, listen: false);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/signin.jpg'), fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                width: Device.width * 0.75,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildAvatar(),
                      SizedBox(height: 20),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 34),
                      SimpleInput(
                        hint: 'Phone number or email',
                        controller: model.input1Controller,
                      ),
                      SizedBox(height: 20),
                      SimpleInput(
                        hint: 'Username or name',
                        controller: model.input2Controller,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.black,
                            value: true,
                            activeColor: Colors.white,
                            onChanged: (v) => null,
                          ),
                          Text(
                            'Keep me signed in',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      MainButton(
                        ontap: () => model.sign(context),
                        label: 'Sign in',
                      ),
                      SizedBox(height: 33),
                      Row(
                        children: [
                          Expanded(child: CustomDivider()),
                          Expanded(
                              flex: 2,
                              child: Center(
                                  child: Text(
                                'Share our app',
                                style: AppStyles.style1(color: AppColor.grey),
                              ))),
                          Expanded(child: CustomDivider()),
                        ],
                      ),
                      SizedBox(height: 33),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialIcon(icon: 'copy'),
                          SocialIcon(icon: 'facebook'),
                          SocialIcon(icon: 'insta'),
                          SocialIcon(icon: 'twit'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: 77,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
