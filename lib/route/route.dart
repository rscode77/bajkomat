import 'package:bajkomat/screens/main_view.dart';
import 'package:bajkomat/screens/story_view.dart';
import 'package:flutter/material.dart';

const String mainView = 'main';
const String storyView = 'story';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case mainView:
      builder = (BuildContext _) => const MainView();
      break;
    case storyView:
      builder = (BuildContext _) => const StoryView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
