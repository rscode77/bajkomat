import 'package:bajkomat/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/ai_story_generator/ai_story_generator_bloc.dart';
import '../blocs/favorite_story/favorite_story_bloc.dart';
import '../models/story_model.dart';
import '../route/route.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sideMenuHeader,
      child: BlocBuilder<FavoriteStoryBloc, FavoriteStoryState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 110,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: sideMenuBackground,
                  ),
                  child: Text(
                    'Lista zapisanych bajek',
                    style: GoogleFonts.cormorant(fontSize: 22, color: textLight, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.stories.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      child: Text(
                        'Kliknij w tytuł aby wyświetlić zapisany utwór',
                        style: GoogleFonts.cormorant(fontSize: 16, color: textHint, fontWeight: FontWeight.w300),
                      ),
                    ),
                  for (Story story in state.stories)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<AiStoryGeneratorBloc>().add(LoadFavoriteStory(title: story.title));
                                Navigator.pushNamed(context, storyView);
                              },
                              child: SizedBox(
                                width: 230,
                                height: 40,
                                child: Row(
                                  children: [
                                    const Gap(15),
                                    Icon(Icons.arrow_circle_right_sharp, size: 20, color: textLight),
                                    const Gap(15),
                                    Text(
                                      story.title,
                                      style: GoogleFonts.cormorant(
                                        fontSize: 20,
                                        color: textLight,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.read<FavoriteStoryBloc>().add(DeleteFavoriteStory(title: story.title));
                              },
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    const Gap(20),
                                    Icon(
                                      Icons.delete_forever_rounded,
                                      size: 25,
                                      color: textMedium,
                                    ),
                                    const Gap(20),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  if (state.stories.isEmpty)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Text(
                            'Lista ububionych bajek jest pusta',
                            style: GoogleFonts.cormorant(fontSize: 16, color: textHint, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
