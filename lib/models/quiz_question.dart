class QuizQuestion{
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;



  // This method creates a new list of answers, shuffles it, and returns the shuffled list.
  List<String>getShuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}