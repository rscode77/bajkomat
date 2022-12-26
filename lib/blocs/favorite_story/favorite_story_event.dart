// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_story_bloc.dart';

abstract class FavoriteStoryEvent extends Equatable {
  const FavoriteStoryEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteStories extends FavoriteStoryEvent {}

class AddFavoriteStories extends FavoriteStoryEvent {
  final String title;
  final String story;
  const AddFavoriteStories({
    required this.title,
    required this.story,
  });

  @override
  List<Object> get props => [title];
}

class DeleteFavoriteStory extends FavoriteStoryEvent {
  final String title;

  const DeleteFavoriteStory({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}
