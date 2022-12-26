import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../controller/ai_controller.dart';
import '../../controller/db_controller.dart';

part 'ai_story_generator_event.dart';
part 'ai_story_generator_state.dart';

class AiStoryGeneratorBloc extends Bloc<AiStoryGeneratorEvent, AiStoryGeneratorState> {
  AiStoryGeneratorBloc() : super(const AiStoryGeneratorState(story: '')) {
    on<GenerateStoryEvent>((event, emit) async {
      emit(AiStoryGeneratingState());

      var story = await AiController().storyGenerator(
          'Napisz krótki utwór literacki dla dzieci zawierający morał, którego akcja dzieje się w ${event.place} a jego główni bohaterowie to ${event.heroes}');

      emit(AiStoryGeneratorState(story: story.choices[0].text));
    });
    on<LoadFavoriteStory>((event, emit) async {
      emit(AiStoryGeneratingState());

      await DatabaseService().initialDatabase();
      var story = await DatabaseService().getStory(event.title);

      emit(AiStoryGeneratorState(story: story));
    });
  }
}
