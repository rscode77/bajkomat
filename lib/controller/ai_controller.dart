import 'package:openai_client/openai_client.dart';

class AiController {
  static const configuration = OpenAIConfiguration(
    apiKey: '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',
  );

  final client = OpenAIClient(
    configuration: configuration,
    enableLogging: true,
  );

  Future<Completion> storyGenerator(String parameter) async {
    final completion = await AiController()
        .client
        .completions
        .create(
          model: 'text-davinci-003',
          prompt: parameter,
          maxTokens: 1000,
        )
        .data;

    return completion;
  }
}
