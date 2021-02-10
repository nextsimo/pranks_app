import 'package:flutter/material.dart';
import 'package:prank/src/utils/styles.dart';
import 'package:prank/src/widgets/inputs/keyboard_visibilty.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class ChatView extends StatelessWidget {
  final List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF313036),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgIcon(icon: "back"),
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
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SvgIcon(icon: "awesome-video"),
                      SvgIcon(icon: "accept_call"),
                    ],
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                    thickness: 1,
                  ),
                  Text("Today",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
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
          Align(
              alignment: Alignment.bottomCenter,
              child: buildRowSendMsg(context))
        ],
      ),
    );
  }

  Widget buildRowSendMsg(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (_, __, visible) {
        return Padding(
          padding: EdgeInsets.only(bottom: visible ? 10 : 120),
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
        );
      },
    );
  }

  Widget buildTextField() {
    return SizedBox(
      height: 65,
      child: TextField(
        expands: true,
        maxLength: null,
        maxLines: null,
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
