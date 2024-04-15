class Question {
  final int indexOfCorrectAnswers;
  final List<String> answers;
  final String image;

  Question(
      {required this.indexOfCorrectAnswers,
      required this.image,
      required this.answers});

  static List<Question> dummyData() {
    List<Question> questions = [
      Question(
          indexOfCorrectAnswers: 3,
          answers: ['Armenia', 'Australia', 'Aruba', 'Argentina '],
          image: "assets/images/Argentina.png"),
      Question(
          indexOfCorrectAnswers: 1,
          answers: ['Bostwana ', 'Brazil', 'Belize', 'Bolivia '],
          image: "assets/images/brazil.png"),
      Question(
          indexOfCorrectAnswers: 1,
          answers: ['Libya', 'Egypt', 'Oman', 'Sudan'],
          image: "assets/images/egypt.png"),
      Question(
          indexOfCorrectAnswers: 3,
          answers: ['France', 'Spain', 'Algeria', 'Scotland'],
          image: "assets/images/scotland.png"),
      Question(
          indexOfCorrectAnswers: 1,
          answers: ['Tonga', 'Lebanon', 'Kuwait', 'Morocco'],
          image: "assets/images/lebanon.png"),
    ];

    return questions;
  }
}
