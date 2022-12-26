// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ai_story_generator_bloc.dart';

class AiStoryGeneratorState extends Equatable {
  final String story;
  const AiStoryGeneratorState({
    this.story = '',
  });

  @override
  List<Object> get props => [];
}

class AiStoryGeneratingState extends AiStoryGeneratorState {}
