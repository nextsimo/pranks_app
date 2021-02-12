import 'package:flutter/material.dart';

import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/styles.dart';
import 'package:prank/src/view/Call/time_to_call.dart';
import 'package:prank/src/view/Call/time_to_call_video.dart';
import 'package:prank/src/view/animation/box_animation.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';

import 'package:prank/src/widgets/more/ads_container.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class ChatView extends StatelessWidget {
  final List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
  ];

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.jumpTo(controller.position.maxScrollExtent);
    });
    return Scaffold(
      backgroundColor: Color(0xFF313036),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  color: Color(0xFF313036),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () =>
                                      navigateTo(context, NavigationView()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgIcon(icon: "back"),
                                  )),
                              buildStackprofil(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lina Thomson",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Online",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFFE6E6E6)),
                                  ),
                                ],
                              ),
                              BoxAnimation(),
                              InkWell(
                                onTap: () =>
                                    navigateTo(context, TimeToCallVideo()),
                                child: SvgIcon(icon: "awesome-video"),
                              ),
                              InkWell(
                                onTap: () => navigateTo(context, TimeToCall()),
                                child: SvgIcon(icon: "accept_call"),
                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0xFFE6E6E6),
                            thickness: 1,
                          ),
                          Text("Today",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: messages.length,
                      padding: EdgeInsets.only(top: 10, bottom: 200),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 6, bottom: 10),
                          child: Align(
                            alignment:
                                (messages[index].messageType == "receiver"
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    (messages[index].messageType == "receiver"
                                        ? Colors.white
                                        : Color(0xFFFFCE00)),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(
                                messages[index].messageContent,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    buildRowSendMsg(context),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AdsContainer(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowSendMsg(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            SizedBox(width: 50),
            Expanded(
              child: buildTextField(),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                //TODO
              },
              child: Container(
                height: 63,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Color(0xFFFFCE00),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgIcon(icon: "send"),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget buildTextField() {
    return SizedBox(
      height: 65,
      child: TextField(
        expands: true,
        maxLength: null,
        maxLines: null,
        onTap: () {
          controller.jumpTo(controller.position.maxScrollExtent);
        },
        decoration: InputDecoration(
          hintText: "Text Message",
          hintStyle: TextStyle(
            fontSize: 14,
            color: AppColor.black,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21),
            borderSide: BorderSide(color: AppColor.grey, width: 2),
          ),
        ),
      ),
    );
  }

  Stack buildStackprofil() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(360),
          child: Image.asset(
            "assets/img.webp",
            fit: BoxFit.cover,
            width: 45,
            height: 45,
          ),
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: Color(0xFF57C152),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}
