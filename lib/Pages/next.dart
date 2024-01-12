// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, camel_case_types, non_constant_identifier_names, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnit/Components/video_widgets.dart';
import 'package:learnit/Utils/color.dart';
import '../Utils/text.dart';

class Video_Player extends StatefulWidget {
  Video_Player(this.a, {Key? key}) : super(key: key);
  int a;

  @override
  State<Video_Player> createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
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
  List<String> description = [
    'A noun is a word that functions as the name of a specific object or set of objects, such as living creatures, places, actions, qualities, states of existence, or ideas. However, noun is not a semantic category, so that it cannot be characterized in terms of its meaning.',
    'A pronoun is a word that substitutes for a noun or noun phrase. Pronouns can refer to either a noun that has already been mentioned and is understood by the listener/reader (e.g., I, you, he, she, it, we, they) or a noun that is about to be mentioned (e.g., you, it, this, that).',
    'A verb is a word that in syntax conveys an action, an occurrence, or a state of being. In the usual description of English, the basic form, with or without the particle to, is the infinitive. In many languages, verbs are inflected (modified in form) to encode tense, aspect, mood, and voice.',
    'An adjective is a word that describes a noun (the name of a thing or a place). ' +
        'It tells you something about the noun. For example, a red ' +
        'hat (here red is the adjective). ' +
        'Adjectives are describing words. ' +
        'Adverbs are words that describe verbs (like speak), adjectives (like beautiful) or other adverbs (like quickly).',
    'An adverb is a word that modifies (gives us more information about) a verb in a sentence. Common adverbs include quickly, slowly, quietly, loudly, beautifully and badly. A word is an adverb if it answers how, when, or where.',
    'A preposition is a word or group of words used before a noun, pronoun, or noun phrase to show direction, time, place, location, spatial relationships, or to introduce an object. Some examples of prepositions are words like "in," "at," "on," "of," and "to."',
    'A conjunction is a part of speech that is used to connect words, phrases, clauses, or sentences. Conjunctions are considered to be invariable grammar particle, and they may or may not stand between items they conjoin.',
    'An interjection is a word or expression in the nature of a word that shows the emotion or feeling of the author. These words or expressions are usually not grammatically related to the other words in a sentence. They are used to express emotion, such as surprise, disgust, happiness, etc.',
  ];
  @override
  void dispose() async {
    super.dispose();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    var asp = MediaQuery.of(context).size.aspectRatio;
    var z = hei / wid;
    return Scaffold(
      backgroundColor: Color(0xFF171617),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  await SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: iconColor,
                    size: z * 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: text(title[widget.a], z * 9, iconColor, 2),
              ),
            ],
          ),
          SizedBox(height: 20),
          VideoWidgetPlayer(
            a: title[widget.a],
            b: description[widget.a],
            isNext: false,
          ),
        ],
      ),
    );
  }
}
