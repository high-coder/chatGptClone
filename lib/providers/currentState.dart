import 'package:chatgpt_flutter/models/chat_model.dart';
import 'package:chatgpt_flutter/services/apiCall.dart';
import 'package:flutter/material.dart';

import '../models/chatGpt_response.dart';

/// this class will be used to make the api call to chatgpt

class CurrentState extends ChangeNotifier {
  bool loading = false;
  ApiCallService apiCallService = ApiCallService();
  String model = "gpt-3.5-turbo";
  String role = "user";

  List<MessageBuilderUiModel> listMessages = [];

  addMessage(MessageBuilderUiModel data) {
    listMessages.add(data);
    notifyListeners();
  }

  // this function will be used to modify the ui of the applicaiton
  sendMessage(String message) async {
    addMessage(MessageBuilderUiModel(message: message, whoAmI: "user"));
    loading = true;
    notifyListeners();
    print(message);
    ChatGptResponse? response =
        await apiCallService.sendMessage(ChatSendModel(message: [
      MessageSend(
        message: message,
        role: 'user',
      )
    ], model: model, temperature: 0.7));
    if (response != null) {
      addMessage(MessageBuilderUiModel(
          message: response.choices![0].message?.content ?? "",
          whoAmI: "chatGpt"));
    }
    loading = false;
    notifyListeners();
  }
}
