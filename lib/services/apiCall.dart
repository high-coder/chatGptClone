import 'dart:convert';

import 'package:chatgpt_flutter/models/chatGpt_response.dart';
import 'package:http/http.dart' as http;

import '../models/chat_model.dart';

class ApiCallService {
  String apiKey = "your-api-key";
  // this function will call the udnerlying api of the open ai
  Future<ChatGptResponse?> sendMessage(ChatSendModel message) async {
    print(message.toJson());
    var link = Uri.parse("https://api.openai.com/v1/chat/completions");
    var data = await http.post(link,
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode(message.toJson()));

    Map<String, dynamic> dataAll = jsonDecode(data.body);
    ChatGptResponse? response = ChatGptResponse.fromJson(dataAll);
    print(response.model);
    print(dataAll);
    return response;
  }

  fetchModels() async {
    var link = Uri.parse("https://api.openai.com/v1/models");
    var data = await http.get(link, headers: {
      "Authorization": "Bearer $apiKey",
    });

    Map dataAll = jsonDecode(data.body);
    print(dataAll);
  }
}
