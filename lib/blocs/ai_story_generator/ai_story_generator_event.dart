// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ai_story_generator_bloc.dart';

abstract class AiStoryGeneratorEvent extends Equatable {
  const AiStoryGeneratorEvent();

  @override
  List<Object> get props => [];
}

class GenerateStoryEvent extends AiStoryGeneratorEvent {
  final String heroes;
  final String place;
  const GenerateStoryEvent({
    required this.heroes,
    required this.place,
  });
  @override
  List<Object> get props => [heroes, place];
}

class LoadFavoriteStory extends AiStoryGeneratorEvent {
  final String title;

  const LoadFavoriteStory({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}
