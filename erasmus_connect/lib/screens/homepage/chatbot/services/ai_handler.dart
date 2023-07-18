import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final openAI = OpenAI.instance.build(
    token: "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",
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );
//Open aid free trail usage veriyor. Onu kullanarak bu api key aldık. Ancak, bazen oluşturduğumuz api key silinebiliyor. Sonradan yine ücretsiz bir şekilde tekrar oluşturup ekleyebiliyoruz.

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
