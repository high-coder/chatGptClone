class ChatSendModel {
  double temperature;
  String model;
  List<MessageSend> message;

  ChatSendModel({
    required this.message,
    required this.model,
    required this.temperature,
  });

  Map<String, dynamic> toJson() {
    List toMapData = [];
    for (var element in message) {
      toMapData.add(element.toJson());
    }

    return {
      "temperature": temperature,
      "model": model,
      "messages": toMapData,
      "max_tokens": 100,
    };
  }
}

class MessageSend {
  String role;
  String message;

  MessageSend({required this.message, required this.role});

  Map<String, dynamic> toJson() {
    return {
      "role": role,
      "content": message,
    };
  }
}

class MessageBuilderUiModel {
  String message;
  String whoAmI;

  MessageBuilderUiModel({required this.message, required this.whoAmI});
}
