import 'package:bajkomat/blocs/ai_story_generator/ai_story_generator_bloc.dart';
import 'package:bajkomat/blocs/favorite_story/favorite_story_bloc.dart';
import 'package:bajkomat/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bajkomat/widgets/text_field_widget.dart';

import '../contants.dart';

class TitleDialog extends StatefulWidget {
  const TitleDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  State<TitleDialog> createState() => _TitleDialogState();
}

class _TitleDialogState extends State<TitleDialog> {
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: alertDialogBackgroudColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
      title: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Text(
          'Zapisywanie',
          style: GoogleFonts.cormorant(
            color: buttonColorLight,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  'Wprowadź tytuł bajki',
                  style: GoogleFonts.cormorant(
                    color: textHint,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Gap(15),
              SizedBox(
                height: 55,
                child: TextFieldWidget(
                    text: 'Wprowadź nazwę',
                    obscureText: false,
                    controller: title,
                    icon: Icon(
                      Icons.bookmark_rounded,
                      color: iconLight,
                    )),
              ),
              const Gap(25),
              SizedBox(
                width: 270,
                child: Text(
                  'Zapisanie utworu umożliwia łaty powrót do bajki, dostęp do zapisanych utworów z pozycji strony głownej',
                  style: GoogleFonts.cormorant(
                    color: textHint,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Gap(25),
              ButtonWidget(
                  text: 'Zapisz bajkę',
                  onPressed: () {
                    var story = context.read<AiStoryGeneratorBloc>().state.story;
                    context.read<FavoriteStoryBloc>().add(AddFavoriteStories(title: title.text, story: story));

                    Navigator.pop(context);
                  },
                  color: buttonColorLight,
                  textColor: buttonColorDark),
              const Gap(20),
            ],
          ),
        ),
      ],
    );
  }
}
