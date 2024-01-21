// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations, unused_local_variable, must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnit/Components/video_widgets.dart';
import 'package:learnit/Utils/text.dart';
import '../Utils/color.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.name});
  String name;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  List<String> videoName = [
    'noun',
    'pronoun',
    'verb',
    'adjective',
    'adverb',
    'preposition',
    'conjunction',
    'interjection',
  ];
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    int hr = DateTime.now().hour;
    bool isMorning = hr < 12;
    bool isAfternoon = hr >= 12 && hr < 17;
    var asp = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      backgroundColor: Color(0xFF171617),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, left: 20),
                      child: Image.asset('assets/img/Learn-it.png',
                          height: asp * 80),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 50, left: 20),
                        child: text('Learn-IT', asp * 55, Colors.white, 3)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                name: FirebaseAuth
                                    .instance.currentUser!.displayName
                                    .toString())));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 50, right: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(color: iconColor, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.person_3_sharp,
                      color: iconColor,
                      size: asp * 50,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: text('Hello, ${widget.name}!', asp * 45, iconColor, 2),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: text(
                  (isMorning)
                      ? 'Good Morning,'
                      : (isAfternoon)
                          ? 'Good Afternoon,'
                          : 'Good Evening,',
                  asp * 35,
                  iconColor,
                  2),
            ),
            Container(
              height: hei * 0.8,
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return VideoWidgetPlayer(
                        a: title[index], b: description[index], isNext: true);
                  },
                  itemCount: title.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
