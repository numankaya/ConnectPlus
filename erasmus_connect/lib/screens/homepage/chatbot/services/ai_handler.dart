import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final openAI = OpenAI.instance.build(
    token: "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",
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  Future<String> getResponse(String message) async {
    try {
      final request = ChatCompleteText(messages: [
        Map.of({"role": "user", "content": message})
      ], maxToken: 200, model: kChatGptTurbo0301Model);

      final response = await openAI.onChatCompletion(request: request);
      if (response != null) {
        return response.choices[0].message.content.trim();
      }

      return 'Something went wrong';
    } catch (e) {
      print(e.toString());
      return 'Bad response';
    }
  }

  void dispose() {
    openAI.close();
  }
}
