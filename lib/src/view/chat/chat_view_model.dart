import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:prank/src/view/chat/chat.dart';

class ChatViewModel {
  void Response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/BirthDayWisher-27d44bfaad84.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
  }
}
