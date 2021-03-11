import 'package:flutter/material.dart';
import 'package:prank/src/models/type_of_call_model.dart';
import 'package:prank/src/services/wallpapers_service.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/call_video/Incoming_call.dart';
import 'package:prank/src/view/call_video/call.dart';
import 'package:prank/src/view/animation/box_animation.dart';
import 'package:prank/src/view/call_video/call/typeofcall_provider.dart';
import 'package:prank/src/widgets/app_bar/app_bar_with_text.dart';
import 'package:prank/src/widgets/buttons/button_call.dart';
import 'package:prank/src/widgets/buttons/next_call.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/container_black.dart';
import 'package:provider/provider.dart';

class TypeOfCall extends StatelessWidget {
  @override
  Widget build(_) {
    return Material(
      color: Color(0xFF212121),
      child: ChangeNotifierProvider<TypeOfCallProvider>(
        create: (_) => TypeOfCallProvider(),
        builder: (BuildContext context, __) {
          TypeOfCallProvider typeOfCallProvider =
              Provider.of<TypeOfCallProvider>(context, listen: false);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 300),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBarWiithText(text: "Type of Call"),
                        Selector<TypeOfCallProvider, int>(
                          selector: (_, m) => m.selectedIndex,
                          builder: (_, int selectedIndex, __) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Next(
                                color: selectedIndex != null
                                    ? Color(0xffFFCE00)
                                    : Colors.grey,
                                function: selectedIndex == null
                                    ? () {}
                                    : () => navigateTo(
                                        context,
                                        IncommingCall(
                                          title: "Incoming call ",
                                          page: Call(
                                              audio: papersService.typesOfcalls
                                                  .elementAt(typeOfCallProvider
                                                      .selectedIndex)
                                                  .audio),
                                        )),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 92,
                            height: 92,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/img.webp"),
                              ),
                            ),
                          ),
                          BoxAnimation(),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Selector<WallpapersService, List<TypeOfCallModel>>(
                      builder: (_, types, __) {
                        return Selector<TypeOfCallProvider, int>(
                          selector: (_, m) => m.selectedIndex,
                          builder: (_, int selectedIndex, __) {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, int index) {
                                TypeOfCallModel typeOfCall = types[index];
                                return ButtonCall(
                                  text1: typeOfCall.emojis,
                                  text2: typeOfCall.label,
                                  isLocked: typeOfCall.isLocked,
                                  selected: selectedIndex == index,
                                  ontap: () async {
                                    if (typeOfCall.isLocked) {
                                      await Future.delayed(
                                          Duration(seconds: 3));
                                      // TODO show ads video
                                    }
                                    typeOfCallProvider.selectedIndex = index;
                                  },
                                );
                              },
                              separatorBuilder: (_, __) => SizedBox(height: 15),
                              itemCount: types.length,
                            );
                          },
                        );
                      },
                      selector: (_, m) => m.typesOfcalls,
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  ContainerBlack(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AdsContainer(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
