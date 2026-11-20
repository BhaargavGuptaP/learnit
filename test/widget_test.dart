// Regression tests for the quiz data, quiz answer counting and the results
// percentage. None of these need Firebase.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learnit/Components/questions.dart';
import 'package:learnit/Pages/quiz.dart';
import 'package:learnit/Pages/view_Result_Page.dart';
import 'package:learnit/Utils/firebase.dart';

void main() {
  // Same order as the lessons on the home screen.
  final quizzes = <String, (List<String>, List<List<String>>, List<String>)>{
    'noun': (nounQuestions, nounOptions, nounAnswers),
    'pronoun': (pronounQuestions, pronounOptions, pronounAnswers),
    'verb': (verbQuestions, verbOptions, verbAnswers),
    'adjective': (adjectiveQuestions, adjectiveOptions, adjectiveAnswers),
    'adverb': (adverbQuestions, adverbOptions, adverbAnswers),
    'preposition': (prepositionQuestions, prepositionOptions, prepositionAnswers),
    'conjunction': (conjunctionQuestions, conjunctionOptions, conjunctionAnswers),
    'interjection': (
      interjectionQuestions,
      interjectionOptions,
      interjectionAnswers
    ),
  };

  test('quiz names line up with the lessons and the results fields', () {
    expect(quizNames, videoName);
    expect(quizNames, quizzes.keys.toList());
    final fields = UserModel(
      noun: 0,
      pronoun: 0,
      verb: 0,
      adjective: 0,
      adverb: 0,
      preposition: 0,
      conjunction: 0,
      interjection: 0,
    ).toJson().keys;
    expect(fields.toSet(), quizNames.toSet());
  });

  quizzes.forEach((name, quiz) {
    final (questions, options, answers) = quiz;
    test('$name quiz: every answer is one of its 4 distinct options', () {
      expect(questions, hasLength(10));
      expect(options, hasLength(10));
      expect(answers, hasLength(10));
      for (var i = 0; i < 10; i++) {
        expect(options[i], hasLength(4), reason: '$name Q${i + 1}');
        expect(options[i].toSet(), hasLength(4),
            reason: '$name Q${i + 1} has duplicate options');
        expect(options[i], contains(answers[i]),
            reason: '$name Q${i + 1}: answer "${answers[i]}" is not an option');
      }
    });
  });

  void usePhoneScreen(WidgetTester tester) {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
  }

  testWidgets('clearing an unanswered question does not block Submit',
      (tester) async {
    usePhoneScreen(tester);
    final questions = [for (var q = 1; q <= 10; q++) 'Q$q'];
    final options = [
      for (var q = 1; q <= 10; q++) ['a$q', 'b$q', 'c$q', 'd$q']
    ];
    final answers = [for (var q = 1; q <= 10; q++) 'a$q'];
    await tester.pumpWidget(MaterialApp(
      home: Quiz(
        questions: questions,
        options: options,
        answers: answers,
        quizName: 'noun',
      ),
    ));

    // Bring a question to the top of the list, clear of the Submit bar.
    Future<void> show(String text) async {
      await tester.scrollUntilVisible(find.text(text), 100,
          scrollable: find.byType(Scrollable).last);
      await tester.ensureVisible(find.text(text));
      await tester.pumpAndSettle();
    }

    Future<void> choose(int q) async {
      await show('Q$q');
      final row = find.ancestor(of: find.text('a$q'), matching: find.byType(Row));
      await tester.tap(find
          .descendant(of: row.first, matching: find.byIcon(Icons.check_rounded))
          .first);
      await tester.pump();
    }

    await choose(1);
    // Clear question 2 before answering it.
    await show('Q2');
    final card2 =
        find.ancestor(of: find.text('Q2'), matching: find.byType(Column)).first;
    await tester.tap(
        find.descendant(of: card2, matching: find.text('Clear Selection')));
    await tester.pump();
    for (var q = 2; q <= 10; q++) {
      await choose(q);
    }

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(find.text('Please answer all the questions'), findsNothing);
    // Submitting opens the results page, which needs Firebase; ignore that.
    tester.takeException();
  });

  testWidgets('total percentage is out of all 80 questions', (tester) async {
    usePhoneScreen(tester);
    final user = UserModel(
      noun: 10,
      pronoun: 10,
      verb: 10,
      adjective: 10,
      adverb: 0,
      preposition: 0,
      conjunction: 0,
      interjection: 0,
    );
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) =>
              const ViewResult().buildUser(user, 390 / 844, 390, 844),
        ),
      ),
    ));
    expect(find.text('50%'), findsOneWidget);
  });
}
