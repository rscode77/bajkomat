import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bajkomat/models/exceptions.dart';

import '../models/story_model.dart';

class DatabaseService {
  initialDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'stories.db');
    // await deleteDatabase(path);

    Database mydb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int verision) async {
    await db.execute('CREATE TABLE story (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, story STRING)');
  }

  insertStory(String title, String story) async {
    Database db = await initialDatabase();

    if (await allStories().then((value) => value.any((element) => element.title == title))) {
      throw TitleExists();
    }
    await db.transaction((txn) async {
      await txn.rawInsert('INSERT INTO story(title,story) VALUES("$title","$story")');
    });

    return 'Created new story $title';
  }

  Future<List<Story>> allStories() async {
    Database db = await initialDatabase();

    List<Map> list = await db.rawQuery('SELECT * FROM story');
    List<Story> story = [];

    for (var element in list) {
      story.add(Story(id: element['id'], title: element['title'], story: element['story']));
    }

    return story;
  }

  Future<String> getStory(String title) async {
    List<Story> stories = await allStories();

    return stories.where((element) => element.title == title).first.story;
  }

  Future<void> deleteStory(String title) async {
    Database db = await initialDatabase();
    await db.rawQuery('DELETE FROM story where title = "$title"');
  }
}
