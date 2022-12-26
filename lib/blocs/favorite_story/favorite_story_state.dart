part of 'favorite_story_bloc.dart';

class FavoriteStoryState extends Equatable {
  final List<Story> stories;
  const FavoriteStoryState({
    this.stories = const [],
  });

  @override
  List<Object> get props => [stories];
}

class LoadingFavoriteStories extends FavoriteStoryState {}
