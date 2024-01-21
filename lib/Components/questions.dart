List<String> quizNames = [
  'noun',
  'verb',
  'adjective',
  'adverb',
  'pronoun',
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
  ['sun', 'sets', 'behind', 'mountains'],
  ['childs', 'childes', 'children', 'child'],
  ['dog', 'park', 'London', 'tree'],
  ['a', 'cup', 'tea', 'of'],
  ['flock', 'gaggle', 'herd', 'pride'],
  ['kindness', 'everyone', 'touched', 'her'],
  ['president', 'nation', 'addressed', 'the'],
  ['bookcase', 'book', 'case', 'bookshelf'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> nounAnswers = [
  'A person, place, thing, or idea',
  'sets',
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
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['run', 'ran', 'running', 'runs'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> verbAnswers = [
  'Sings',
  'Ran',
  'I am going to the store.',
  'is',
  'playing',
  'swimming',
  'ate',
  'smell',
  'ran',
  'proper'
];
List<List<String>> adjectiveOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['blue', 'sky', 'clear', 'the'],
  ['Happier', 'Happiest', 'Happily', 'Happy'],
  [
    'The dog is the biggest of all.',
    'The dog is bigger than the other dogs.',
    'The dog is big.',
    'The dog is the biggest of all.'
  ],
  ['two', 'big', 'elephants', 'of'],
  ['an', 'old', 'book', 'book'],
  ['sleepy', 'cat', 'curled', 'warm'],
  ['those', 'shoes', 'big', 'too'],
  ['bookcase', 'book', 'case', 'bookshelf'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> adjectiveAnswers = [
  'blue',
  'Happiest',
  'The dog is the biggest of all.',
  'big',
  'old',
  'sleepy',
  'shoes',
  'those',
  'book',
  'proper'
];
List<List<String>> adverbOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['She', 'Speaks', 'Softly', 'The'],
  ['Quick', 'Quicker', 'Quickly', 'Quicklier'],
  [
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['run', 'ran', 'running', 'runs'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> adverbAnswers = [
  'Softly',
  'Quickly',
  'I am going to the store.',
  'is',
  'playing',
  'swimming',
  'delicious',
  'smell',
  'running',
  'common'
];
List<List<String>> pronounOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['I', 'Will', 'You', 'At'],
  ['Childs', 'Child', 'Children', 'Childes'],
  [
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['run', 'ran', 'running', 'runs'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> pronounAnswers = [
  'I',
  'Children',
  'I am going to the store.',
  'playing',
  'swim',
  'the',
  'They',
  'Everyone',
  'run',
  'common'
];
List<List<String>> prepositionOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['The', 'Book', 'Is', 'On'],
  ['On', 'In', 'Under', 'Over'],
  [
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['run', 'ran', 'running', 'runs'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> prepositionAnswers = [
  'On',
  'On',
  'I am going to the store.',
  'I am going to the store.',
  'of',
  'park',
  'off',
  'inside',
  'run',
  'proper'
];
List<List<String>> conjunctionOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['I', 'Like', 'To', 'Read'],
  ['And', 'Or', 'But', 'Nor'],
  [
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['run', 'ran', 'running', 'runs'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> conjunctionAnswers = [
  'I',
  'And',
  'Or',
  'I am going to the store.',
  'or',
  'but',
  'I like to read or write.',
  'and',
  'ran',
  'common'
];
List<List<String>> interjectionOptions = [
  [
    'A describing word',
    'An action word',
    'A person, place, thing, or idea',
    'A linking word'
  ],
  ['Wow', 'That', 'Was', 'A'],
  ['Wow', 'That', 'Was', 'A'],
  [
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.',
    'I am going to the store.'
  ],
  ['is', 'playing', 'cup', 'of'],
  ['swim', 'swam', 'swimming', 'swum'],
  ['ate', 'delicious', 'cake', 'the'],
  ['flowers', 'smell', 'wonderful', 'the'],
  ['run', 'ran', 'running', 'runs'],
  ['common', 'proper', 'abstract', 'collective']
];
List<String> interjectionAnswers = [
  'Wow',
  'Wow',
  'Wow',
  'Wow',
  'playing',
  'swim',
  'ate',
  'flowers',
  'run',
  'common'
];
