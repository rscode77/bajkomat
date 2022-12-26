import 'package:bajkomat/contants.dart';
import 'package:bajkomat/widgets/button_widget.dart';
import 'package:bajkomat/widgets/label_widget.dart';
import 'package:bajkomat/widgets/story_parameter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/side_menu_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  TextEditingController text = TextEditingController();
  TextEditingController storyHeroesController = TextEditingController();
  TextEditingController storyPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      drawerScrimColor: black,
      drawer: const SideMenuWidget(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [background, background1],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.2, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu_open_rounded,
                                    color: iconLight,
                                    size: 35,
                                  ),
                                ),
                                const Gap(20),
                                Text(
                                  'Witaj w aplikacji bajkomat',
                                  style: GoogleFonts.cormorant(
                                    color: iconLight,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset("graphics/main_graphic.png"),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(20),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: LabelWidget(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: textLight,
                                text: 'Czym jest bajkomat?',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: LabelWidget(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: textLight,
                                text: 'bajkomat to aplikacja wykorzystująca sztuczną intelgencję do generowania bajek na podstawie Twoich wyborów',
                              ),
                            ),
                            const Gap(20),
                            ButtonWidget(
                              text: 'Wygeneruj bajkę',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const StoryParameter(),
                                );
                              },
                              color: buttonColorLight,
                              textColor: textDark,
                            ),
                            const Gap(10),
                            ButtonWidget(
                              text: 'Wylosuj popularny utwór',
                              onPressed: () {
                                //not implemented yet
                              },
                              color: buttonColorLight,
                              textColor: textDark,
                            ),
                            const Gap(60),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
