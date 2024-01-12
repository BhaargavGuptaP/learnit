// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, must_be_immutable, avoid_unnecessary_containers, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnit/Components/questions.dart';
import 'package:learnit/Pages/fullscreen.dart';
import 'package:learnit/Utils/color.dart';
import 'package:learnit/Utils/text.dart';
import 'package:video_player/video_player.dart';

import '../Pages/next.dart';
import '../Pages/quiz.dart';

class VideoWidgetPlayer extends StatefulWidget {
  VideoWidgetPlayer({
    super.key,
    required this.a,
    required this.b,
    required this.isNext,
  });
  String a;
  String b;
  bool isNext;

  @override
  State<VideoWidgetPlayer> createState() => _VideoWidgetPlayerState();
}

class _VideoWidgetPlayerState extends State<VideoWidgetPlayer> {
  bool isLand = false;
  @override
  void initState() {
    super.initState();

    con = VideoPlayerController.asset(
        'assets/videos/${video_name[title.indexOf(widget.a)]}.mp4');
    con.addListener(() {
      setState(() {});
    });
    con.initialize().then((_) => setState(() {}));
    con.pause();
    if (!widget.isNext && isLand) setLandscape();
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    con.dispose();
    super.dispose();
  }

  late VideoPlayerController con;

  bool x = false;
  bool s = false;

  List<String> title = [
    '1. Parts of Speech - (Noun)',
    '2. Parts of Speech - (Pronoun)',
    '3. Parts of Speech - (Verb)',
    '4. Parts of Speech - (Adjective)',
    '5. Parts of Speech - (Adverb)',
    '6. Parts of Speech - (Preposition)',
    '7. Parts of Speech - (Conjunction)',
    '8. Parts of Speech - (Interjection)',
  ];

  List<String> video_name = [
    'noun',
    'pronoun',
    'verb',
    'adjective',
    'adverb',
    'preposition',
    'conjunction',
    'interjection',
  ];
  bool a1 = false;
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    var asp = MediaQuery.of(context).size.aspectRatio;
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        width: wid * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.13)),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.35),
              !x
                  ? Colors.white.withOpacity(0.15)
                  : Colors.white.withOpacity(0.14)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            children: [
              if (widget.isNext) text(widget.a, asp * 40, iconColor, 2),
              SizedBox(height: 10),
              Container(
                  height: 200,
                  width: wid * 0.8,
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: con.value.isPlaying
                      ? VideoPlayer(con)
                      : videoPausePage()),
              SizedBox(height: 10),
              VideoProgressIndicator(
                con,
                allowScrubbing: true,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  allButtons(
                      0,
                      (a1 && con.value.isPlaying)
                          ? Icons.cancel_outlined
                          : Icons.loop_rounded,
                      asp * 1.5),
                  widget.isNext
                      ? allButtons(1, Icons.fit_screen_rounded, asp * 1.5)
                      : allButtons(2, Icons.fullscreen_rounded, asp * 1.5),
                  allButtons(3, Icons.replay_5_rounded, asp * 1.5),
                  allButtons(4, Icons.forward_5_rounded, asp * 1.5),
                  allButtons(
                      5,
                      con.value.isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      asp * 1.5),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child:
                        text('Time', asp * 35, iconColor.withOpacity(0.6), 2),
                  ),
                  text(
                      con.value.duration.inMinutes.toString() +
                          " mins " +
                          (con.value.duration.inMinutes != 0
                                  ? (con.value.duration.inSeconds %
                                      (con.value.duration.inMinutes * 60))
                                  : con.value.duration.inSeconds)
                              .toString() +
                          " secs",
                      asp * 30,
                      iconColor.withOpacity(0.6),
                      2),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: text('Description', asp * 35,
                          iconColor.withOpacity(0.6), 2)),
                  allButtons(
                      6,
                      x
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      asp * 1.5),
                ],
              ),
              x ? SizedBox(height: 5) : SizedBox(),
              x
                  ? Container(
                      child: text(
                          widget.b, asp * 30, iconColor.withOpacity(0.7), 1),
                    )
                  : Container(),
              SizedBox(height: hei * .02),
              GestureDetector(
                onTap: () {
                  int i = title.indexOf(widget.a);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Quiz(
                              questions: i == 0
                                  ? nounQuestions
                                  : i == 1
                                      ? pronounQuestions
                                      : i == 2
                                          ? verbQuestions
                                          : i == 3
                                              ? adjectiveQuestions
                                              : i == 4
                                                  ? adverbQuestions
                                                  : i == 5
                                                      ? prepositionQuestions
                                                      : i == 6
                                                          ? conjunctionQuestions
                                                          : interjectionQuestions,
                              options: i == 0
                                  ? nounOptions
                                  : i == 1
                                      ? pronounOptions
                                      : i == 2
                                          ? verbOptions
                                          : i == 3
                                              ? adjectiveOptions
                                              : i == 4
                                                  ? adverbOptions
                                                  : i == 5
                                                      ? prepositionOptions
                                                      : i == 6
                                                          ? conjunctionOptions
                                                          : interjectionOptions,
                              answers: i == 0
                                  ? nounAnswers
                                  : i == 1
                                      ? pronounAnswers
                                      : i == 2
                                          ? verbAnswers
                                          : i == 3
                                              ? adjectiveAnswers
                                              : i == 4
                                                  ? adverbAnswers
                                                  : i == 5
                                                      ? prepositionAnswers
                                                      : i == 6
                                                          ? conjunctionAnswers
                                                          : interjectionAnswers,
                              quizName: quizNames[i],
                            )),
                  );
                },
                child: Container(
                  height: hei * 0.05,
                  width: wid * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFA500).withOpacity(0.4),
                        Color(0xFFFFA500).withOpacity(0.3)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                    border: Border.all(color: Color(0xFFFFA500)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: text('Start Quiz', asp * 30, iconColor, 2),
                  ),
                ),
              ),
              SizedBox(height: hei * .01)
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector allButtons(int k, IconData icon, double asp) {
    return GestureDetector(
      onTap: () async {
        if (k == 0) {
          setState(() => a1 = !a1);
          a1 ? con.setLooping(true) : con.setLooping(false);
        } else if (k == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Video_Player(
                title.indexOf(widget.a),
              ),
            ),
          );
        } else if (k == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FullScreen(
                        controller: con,
                      )));
        } else if (k == 3) {
          await con.seekTo(Duration(seconds: con.value.position.inSeconds - 5));
        } else if (k == 4) {
          await con.seekTo(Duration(seconds: con.value.position.inSeconds + 5));
        } else if (k == 5) {
          setState(() {
            con.value.isPlaying ? con.pause() : con.play();
          });
        } else if (k == 6) {
          setState(() {
            x = !x;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: asp * 40,
        ),
      ),
    );
  }

  Center videoPausePage() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: buttonDarkBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '${video_name[title.indexOf(widget.a)]}',
          style: TextStyle(
            color: buttonDarkColor,
            fontFamily: 'mont2',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
