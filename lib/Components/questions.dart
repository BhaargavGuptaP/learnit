List<String> quizNames = [
  'noun',
  'pronoun',
  'verb',
  'adjective',
  'adverb',
  'preposition',
  'conjunction',
  'interjection'
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
List<String> nounQuestions = [
  "What is a noun?",
  "Identify the noun in the sentence: 'The sun sets behind the mountains.'",
  "Choose the correct plural form of the noun 'child':",
  "Which of the following is a proper noun?",
  "In the phrase 'a cup of tea,' what is the noun?",
  "What is the collective noun for a group of geese?",
  "Identify the abstract noun in the sentence: 'Her kindness touched everyone.'",
  'Select the common noun in the following: "The president addressed the nation."',
  'Which word is a compound noun?',
  'What type of noun is the word "love" in the sentence: "They shared a deep love for music"?'
];
List<String> verbQuestions = [
  'What is a verb?',
  'Identify the verb in the sentence: "She sings beautifully."',
  'Choose the correct past tense form of the verb "run":',
  'Which sentence contains a helping verb?',
  'In the phrase "is playing," what is the verb?',
  'What is the gerund form of the verb "swim"?',
  'Identify the transitive verb in the sentence: "He ate the delicious cake."',
  'Select the linking verb in the following: "The flowers smell wonderful."',
  'Which word is an irregular verb?',
  'What type of verb is the word "appear" in the sentence: "The magician made the rabbit appear"?'
];
List<String> adjectiveQuestions = [
  'What is an adjective?',
  'Identify the adjective in the sentence: "The blue sky is clear."',
  'Choose the comparative form of the adjective "happy":',
  'Which sentence contains a superlative adjective?',
  'In the phrase "two big elephants," what are the adjectives?',
  'What is the adjective in the phrase: "an old book"?',
  'Identify the adjective in the sentence: "The sleepy cat curled up on the warm blanket."',
  'Select the demonstrative adjective in the following: "Those shoes are too big."',
  'Which word is a proper adjective?',
  'What type of adjective is the word "delicious" in the sentence: "She baked a delicious cake"?'
];
List<String> adverbQuestions = [
  'What is an adverb?',
  'Identify the adverb in the sentence: "She speaks softly."',
  'Choose the correct adverb form for the adjective "quick":',
  'Which sentence contains a sentence adverb?',
  'In the phrase "very slowly," what is the adverb?',
  'What is the adverb in the sentence: "They worked hard on the project"?',
  'Identify the adverb in the sentence: "He completed the task effortlessly."',
  'Select the adverb of frequency in the following: "She rarely misses a class."',
  'Which word is an intensifying adverb?',
  'What type of adverb is the word "here" in the sentence: "Come here"?'
];
List<String> pronounQuestions = [
  'What is a pronoun?',
  'Identify the pronoun in the sentence: "I will meet you at the library."',
  'Choose the correct possessive pronoun for the noun "children":',
  'Which sentence contains a reflexive pronoun?',
  'In the phrase "to them," what is the pronoun?',
  'What is the pronoun in the sentence: "She is a good friend of mine."',
  'Identify the pronoun in the sentence: "They are going to the movies."',
  'Select the indefinite pronoun in the following: "Everyone is welcome to attend."',
  'Which word is a relative pronoun?',
  'What type of pronoun is the word "it" in the sentence: "It is a beautiful day"?'
];
List<String> prepositionQuestions = [
  'What is a preposition?',
  'Identify the preposition in the sentence: "The book is on the table."',
  'Choose the correct preposition to complete the sentence: "The cat jumped ___ the table."',
  'Which sentence contains a prepositional phrase?',
  'In the phrase "in the morning," what is the preposition?',
  'What is the preposition in the sentence: "The dog ran through the park."',
  'Identify the preposition in the sentence: "The cat jumped off the table."',
  'Select the preposition in the following: "The book is inside the box."',
  'Which word is a compound preposition?',
  'What type of preposition is the word "about" in the sentence: "I am thinking about the test"?'
];
List<String> conjunctionQuestions = [
  'What is a conjunction?',
  'Identify the conjunction in the sentence: "I like to read and write."',
  'Choose the correct conjunction to complete the sentence: "I like to read ___ write."',
  'Which sentence contains a correlative conjunction?',
  'In the phrase "or not," what is the conjunction?',
  'What is the conjunction in the sentence: "I like to read but not write."',
  'Identify the conjunction in the sentence: "I like to read or write."',
  'Select the coordinating conjunction in the following: "I like to read and write."',
  'Which word is a subordinating conjunction?',
  'What type of conjunction is the word "and" in the sentence: "I like to read and write"?'
];
List<String> interjectionQuestions = [
  'What is an interjection?',
  'Identify the interjection in the sentence: "Wow! That was a close call."',
  'Choose the correct interjection to complete the sentence: "___! I forgot my homework."',
  'Which sentence contains an interjection?',
  'In the phrase "Oh no," what is the interjection?',
  'What is the interjection in the sentence: "Oh, I forgot my homework."',
  'Identify the interjection in the sentence: "Wow! That was a close call."',
  'Select the interjection in the following: "Oh no! I forgot my homework."',
  'Which word is an interjection?',
  'What type of interjection is the word "wow" in the sentence: "Wow! That was a close call"?'
];
//options
List<List<String>> nounOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['sun', 'sets', 'behind', 'the'],
  ['childs', 'childes', 'children', 'child'],
  ['dog', 'park', 'London', 'tree'],
  ['a', 'cup', 'tea', 'of'],
  ['flock', 'gaggle', 'herd', 'pride'],
  ['kindness', 'everyone', 'touched', 'her'],
  ['president', 'nation', 'addressed', 'the'],
  ['bookcase', 'book', 'case', 'shelf'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> nounAnswers = [
  'A person, place, thing, or idea',
  'sun',
  'children',
  'London',
  'tea',
  'gaggle',
  'kindness',
  'president',
  'bookcase',
  'abstract'
];
List<List<String>> verbOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['She', 'Sings', 'Beautifully', 'The'],
  ['Runned', 'Running', 'Ran', 'Runs'],
  [
    'I went to the store.',
    'She sings beautifully.',
    'I am going to the store.',
    'They play cricket.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['walked', 'ran', 'played', 'jumped'],
  ['transitive', 'intransitive', 'linking', 'helping']
];
List<String> verbAnswers = [
  'An action word',
  'Sings',
  'Ran',
  'I am going to the store.',
  'playing',
  'swimming',
  'ate',
  'smell',
  'ran',
  'intransitive'
];
List<List<String>> adjectiveOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['blue', 'sky', 'is', 'the'],
  ['Happier', 'Happiest', 'Happily', 'Happy'],
  [
    'The dog is the biggest of all.',
    'The dog is bigger than the other dogs.',
    'The dog is big.',
    'The dog barks.'
  ],
  ['big and elephants', 'two and elephants', 'two and big', 'only elephants'],
  ['an', 'old', 'book', 'of'],
  ['sleepy', 'cat', 'curled', 'blanket'],
  ['those', 'shoes', 'big', 'too'],
  ['big', 'happy', 'Indian', 'blue'],
  ['demonstrative', 'possessive', 'descriptive', 'interrogative']
];
List<String> adjectiveAnswers = [
  'A describing word',
  'blue',
  'Happier',
  'The dog is the biggest of all.',
  'two and big',
  'old',
  'sleepy',
  'those',
  'Indian',
  'descriptive'
];
List<List<String>> adverbOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A word that describes a verb'
  ],
  ['She', 'Speaks', 'Softly', 'The'],
  ['Quick', 'Quicker', 'Quickly', 'Quicklier'],
  [
    'The shop was closed.',
    'Unfortunately, the shop was closed.',
    'I am going to the store.',
    'She has a red bag.'
  ],
  ['is', 'playing', 'of', 'very and slowly'],
  ['They', 'worked', 'hard', 'project'],
  ['He', 'completed', 'task', 'effortlessly'],
  ['She', 'rarely', 'misses', 'class'],
  ['run', 'happy', 'very', 'book'],
  ['time', 'manner', 'place', 'frequency']
];
List<String> adverbAnswers = [
  'A word that describes a verb',
  'Softly',
  'Quickly',
  'Unfortunately, the shop was closed.',
  'very and slowly',
  'hard',
  'effortlessly',
  'rarely',
  'very',
  'place'
];
List<List<String>> pronounOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A word used in place of a noun'
  ],
  ['I', 'Will', 'Meet', 'At'],
  ['His', 'Hers', 'Theirs', 'Mine'],
  [
    'She hurt him.',
    'She is going to the store.',
    'They are happy.',
    'She hurt herself.'
  ],
  ['to', 'them', 'cup', 'of'],
  ['She', 'is', 'good', 'friend'],
  ['They', 'are', 'going', 'movies'],
  ['Everyone', 'is', 'welcome', 'attend'],
  ['he', 'they', 'who', 'it'],
  ['reflexive', 'personal', 'relative', 'demonstrative']
];
List<String> pronounAnswers = [
  'A word used in place of a noun',
  'I',
  'Theirs',
  'She hurt herself.',
  'them',
  'She',
  'They',
  'Everyone',
  'who',
  'personal'
];
List<List<String>> prepositionOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A word that shows place, time, or direction'
  ],
  ['The', 'Book', 'Is', 'On'],
  ['Of', 'Since', 'On', 'Until'],
  [
    'I am going.',
    'I am going to the store.',
    'She sings beautifully.',
    'They are happy.'
  ],
  ['in', 'the', 'morning', 'is'],
  ['dog', 'ran', 'through', 'park'],
  ['cat', 'jumped', 'off', 'table'],
  ['book', 'is', 'inside', 'box'],
  ['in', 'within', 'on', 'at'],
  ['time', 'place', 'direction', 'topic']
];
List<String> prepositionAnswers = [
  'A word that shows place, time, or direction',
  'On',
  'On',
  'I am going to the store.',
  'in',
  'through',
  'off',
  'inside',
  'within',
  'topic'
];
List<List<String>> conjunctionOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['I', 'Like', 'To', 'And'],
  ['Because', 'Or', 'Since', 'Nor'],
  [
    'I am going to the store.',
    'I like tea and coffee.',
    'Either you come or I go.',
    'She sings beautifully.'
  ],
  ['or', 'not', 'cup', 'of'],
  ['I', 'like', 'but', 'not'],
  ['I', 'like', 'read', 'or'],
  ['I', 'like', 'read', 'and'],
  ['and', 'or', 'because', 'but'],
  ['subordinating', 'coordinating', 'correlative', 'compound']
];
List<String> conjunctionAnswers = [
  'A linking word',
  'And',
  'Or',
  'Either you come or I go.',
  'or',
  'but',
  'or',
  'and',
  'because',
  'coordinating'
];
List<List<String>> interjectionOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A word that shows sudden feeling'
  ],
  ['Wow', 'That', 'Was', 'A'],
  ['Wow', 'That', 'Was', 'A'],
  [
    'I am going to the store.',
    'She sings beautifully.',
    'Hurray! We won the match.',
    'The dog is big.'
  ],
  ['is', 'Oh no', 'cup', 'of'],
  ['Oh', 'I', 'forgot', 'homework'],
  ['Wow', 'That', 'was', 'call'],
  ['Oh no', 'I', 'forgot', 'homework'],
  ['run', 'happy', 'Hurray', 'table'],
  ['sorrow', 'greeting', 'approval', 'surprise']
];
List<String> interjectionAnswers = [
  'A word that shows sudden feeling',
  'Wow',
  'Wow',
  'Hurray! We won the match.',
  'Oh no',
  'Oh',
  'Wow',
  'Oh no',
  'Hurray',
  'surprise'
];
