class StoryScene {
  const StoryScene({required this.image, required this.narration});

  final String image;
  final String narration;
}

class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  final String question;
  final List<String> answers;
  final int correctAnswer;
}

class StoryFinalCard {
  const StoryFinalCard({required this.background, required this.dog});

  final String background;
  final String dog;
}

class Story {
  const Story({
    required this.title,
    required this.image,
    required this.scenes,
    this.cover,
    this.quiz,
    this.finalCard,
  });

  final String title;
  final String image;
  final String? cover;
  final List<StoryScene> scenes;
  final List<QuizQuestion>? quiz;
  final StoryFinalCard? finalCard;

  bool get hasQuiz => quiz != null && quiz!.isNotEmpty;
}

String assetPath(String path) {
  if (path.startsWith('assets/')) return path;
  final normalized = path.startsWith('/') ? path.substring(1) : path;
  return 'assets/$normalized';
}
