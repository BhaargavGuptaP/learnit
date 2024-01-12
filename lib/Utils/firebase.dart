class UserModel {
  final int noun;
  final int pronoun;
  final int verb;
  final int adjective;
  final int adverb;
  final int preposition;
  final int conjunction;
  final int interjection;
  UserModel(
      {required this.noun,
      required this.pronoun,
      required this.verb,
      required this.adjective,
      required this.adverb,
      required this.preposition,
      required this.conjunction,
      required this.interjection});
  Map<String, int> toJson() {
    return {
      'noun': noun,
      'pronoun': pronoun,
      'verb': verb,
      'adjective': adjective,
      'adverb': adverb,
      'preposition': preposition,
      'conjunction': conjunction,
      'interjection': interjection,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      noun: json['noun'],
      pronoun: json['pronoun'],
      verb: json['verb'],
      adjective: json['adjective'],
      adverb: json['adverb'],
      preposition: json['preposition'],
      conjunction: json['conjunction'],
      interjection: json['interjection'],
    );
  }
}
