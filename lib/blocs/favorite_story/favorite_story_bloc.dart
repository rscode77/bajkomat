import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../controller/db_controller.dart';
import '../../models/story_model.dart';

part 'favorite_story_event.dart';
part 'favorite_story_state.dart';

class FavoriteStoryBloc extends Bloc<FavoriteStoryEvent, FavoriteStoryState> {
  FavoriteStoryBloc() : super(const FavoriteStoryState()) {
    on<LoadFavoriteStories>((event, emit) async {
      await DatabaseService().initialDatabase();

      List<Story> stories = await DatabaseService().allStories();

      if (stories.isNotEmpty) {
        emit(FavoriteStoryState(stories: stories));
      } else {
        emit(const FavoriteStoryState(stories: []));
      }
    });
    on<AddFavoriteStories>((event, emit) async {
      await DatabaseService().initialDatabase();
      await DatabaseService().insertStory(event.title, event.story);

      List<Story> stories = await DatabaseService().allStories();

      if (stories.isNotEmpty) {
        emit(FavoriteStoryState(stories: stories));
      } else {
        emit(const FavoriteStoryState(stories: []));
      }
    });
    on<DeleteFavoriteStory>((event, emit) async {
      await DatabaseService().initialDatabase();
      await DatabaseService().deleteStory(event.title);

      List<Story> stories = await DatabaseService().allStories();

      if (stories.isNotEmpty) {
        emit(FavoriteStoryState(stories: stories));
      } else {
        emit(const FavoriteStoryState(stories: []));
      }
    });
  }
}
