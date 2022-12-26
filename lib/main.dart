import 'package:bajkomat/blocs/ai_story_generator/ai_story_generator_bloc.dart';
import 'package:bajkomat/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bajkomat/route/route.dart' as route;

import 'blocs/favorite_story/favorite_story_bloc.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: textDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteStoryBloc()..add(LoadFavoriteStories()),
        ),
        BlocProvider(
          create: (context) => AiStoryGeneratorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'BAJKOMAT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: route.mainView,
        onGenerateRoute: route.controller,
      ),
    );
  }
}
