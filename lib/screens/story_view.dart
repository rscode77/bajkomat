import 'package:bajkomat/blocs/ai_story_generator/ai_story_generator_bloc.dart';
import 'package:bajkomat/widgets/title_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../contants.dart';
import '../widgets/button_widget.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage("graphics/story_background.png"), fit: BoxFit.cover),
          gradient: LinearGradient(
              colors: [background, textDark],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.2, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                BlocConsumer<AiStoryGeneratorBloc, AiStoryGeneratorState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AiStoryGeneratingState) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                                color: buttonColorLight,
                              ),
                            ),
                            const Gap(50),
                            Text(
                              'generowanie bajki',
                              style: GoogleFonts.cormorant(
                                color: textHint,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          Text(
                            state.story,
                            style: GoogleFonts.cormorant(
                              color: textLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(30),
                          ButtonWidget(
                            text: 'Zapisz bajkę',
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const TitleDialog(
                                  title: 'Potwierdzenie',
                                  description: 'Czy chcesz zapisać bajkę w ulubionych?',
                                ),
                              ).then((value) => {if (value != '') {}});
                            },
                            color: buttonColorLight,
                            textColor: textDark,
                          ),
                          const Gap(10),
                          ButtonWidget(
                            text: 'Wróć do strony głównej',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: buttonColorLight,
                            textColor: textDark,
                          ),
                          const Gap(30),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
