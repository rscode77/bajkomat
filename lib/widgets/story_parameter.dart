import 'package:bajkomat/blocs/ai_story_generator/ai_story_generator_bloc.dart';
import 'package:bajkomat/screens/story_view.dart';
import 'package:bajkomat/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bajkomat/widgets/text_field_widget.dart';

import '../contants.dart';

class StoryParameter extends StatefulWidget {
  const StoryParameter({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryParameter> createState() => _StoryParameterState();
}

class _StoryParameterState extends State<StoryParameter> {
  TextEditingController heroesController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: alertDialogBackgroudColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
      title: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Text(
          'Uzupełnij dane',
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
                height: 55,
                child: TextFieldWidget(
                    text: 'Bohaterowie',
                    obscureText: false,
                    controller: heroesController,
                    icon: Icon(
                      Icons.face_6_rounded,
                      color: buttonColorLight,
                    )),
              ),
              SizedBox(
                height: 55,
                child: TextFieldWidget(
                    text: 'Miejsce akcji',
                    obscureText: false,
                    controller: placeController,
                    icon: Icon(
                      Icons.place_sharp,
                      color: buttonColorLight,
                    )),
              ),
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: 270,
                  child: Text(
                    '*pola mogą pozostać puste',
                    style: GoogleFonts.cormorant(
                      color: textHint,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const Gap(25),
              ButtonWidget(
                  text: 'Wygeneruj bajkę',
                  onPressed: () {
                    context.read<AiStoryGeneratorBloc>().add(GenerateStoryEvent(heroes: heroesController.text, place: placeController.text));

                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => const StoryView(),
                    );
                  },
                  color: buttonColorLight,
                  textColor: textDark),
              const Gap(25),
            ],
          ),
        ),
      ],
    );
  }
}
