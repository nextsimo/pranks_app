import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/base/base_view_model.dart';
import 'package:prank/src/view/login/login_view.dart';
import 'package:prank/src/view/profile/profile_detail_view.dart';
import 'package:prank/src/widgets/app_bar/back_app_bar.dart';
import 'package:prank/src/widgets/more/avatar_profil.dart';
import 'package:prank/src/widgets/more/custom_divider.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class ProfileView extends StatelessWidget {
  final List<ProfilInfoModel> list = [
    ProfilInfoModel(
        icon: "profil", label: "My Profile", page: ProfileDetailView()),
    ProfilInfoModel(icon: "more", label: "More app", page: Material()),
    ProfilInfoModel(icon: "privacy", label: "Privacy Policy", page: Material()),
    ProfilInfoModel(icon: "term", label: "Term of use", page: Material()),
    ProfilInfoModel(icon: "invite", label: "Invite Friends", page: Material()),
  ];
  @override
  Widget build(BuildContext context) {
    Device.init(context);
    return Material(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BackAppBar(
                icone: "back",
                function: () => Navigator.of(context).pop(),
              ),
              buildProfilInfo(),
            ],
          ),
          Column(
            children: [
              Column(
                children: list.map((e) => buildRow(e, context)).toList(),
              ),
              SizedBox(
                height: 65,
              ),
              buildLogOutButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget buildRow(ProfilInfoModel e, BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(context, e.page),
      child: Padding(
        padding: const EdgeInsets.only(top: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              icon: e.icon,
            ),
            SizedBox(
              width: 19,
            ),
            SizedBox(
              width: 160,
              child: Text(
                e.label,
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogOutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        BaseViewModel model = locator<BaseViewModel>();
        model.prefs.clear();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => LoginView()), (route) => false);
      },
      child: Column(
        children: [
          CustomDivider(),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(
                icon: "logout",
              ),
              SizedBox(
                width: 5.4,
              ),
              Text(
                "Login out",
                style: TextStyle(color: Color(0xffF4F4F4), fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }

  Column buildProfilInfo() {
    return Column(
      children: [
        SizedBox(
          height: 27.4,
        ),
        ProfilAvatar(),
        SizedBox(
          height: 7,
        ),
        Text(
          papersService.username,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          papersService.emailPhone,
          style: TextStyle(
              color: Color(0xffC6C6C6),
              fontSize: 10,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class ProfilInfoModel {
  final String label;
  final String icon;
  final Widget page;
  ProfilInfoModel({
    this.page,
    this.label,
    this.icon,
  });
}
