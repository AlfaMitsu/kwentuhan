import 'package:flutter/material.dart';

import '../app_controller.dart';
import '../models/story.dart';
import '../theme/app_theme.dart';
import '../widgets/portrait_frame.dart';
import '../widgets/quiz_answer_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({required this.controller, super.key});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    final story = controller.selectedStory;
    final quiz = story?.quiz ?? const <QuizQuestion>[];
    if (story == null || quiz.isEmpty) return const SizedBox.shrink();
    final question = quiz[controller.quizQuestionIndex];
    return PortraitFrame(
      background: const Color(0xFF78CFEE),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(assetPath('/story-1-scene-17-background-motion.webp'), fit: BoxFit.fill),
              // The source final-card artwork contains its Next button. This opaque layer
              // intentionally masks that button on quiz screens.
              Positioned(
                left: 0,
                right: 0,
                top: constraints.maxHeight * .48,
                bottom: 0,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color(0xFF72C8EF), Color(0xFF8BD8F5)],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * .155,
                left: constraints.maxWidth * .10,
                right: constraints.maxWidth * .10,
                height: constraints.maxHeight * .35,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  decoration: BoxDecoration(
                    color: AppTheme.sky,
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    question.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900, height: 1.3),
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * .52,
                left: 0,
                right: 0,
                bottom: constraints.maxHeight * .03,
                child: Column(
                  children: List<Widget>.generate(question.answers.length, (index) {
                    final answerState = controller.quizSelectedAnswer == index
                        ? switch (controller.quizAnswerState) {
                            QuizAnswerState.correct => QuizAnswerButtonState.correct,
                            QuizAnswerState.wrong => QuizAnswerButtonState.wrong,
                            QuizAnswerState.none => QuizAnswerButtonState.normal,
                          }
                        : QuizAnswerButtonState.normal;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: QuizAnswerButton(
                        answer: question.answers[index],
                        state: answerState,
                        onPressed: () => controller.answerQuiz(index),
                      ),
                    );
                  }),
                ),
              ),
              if (controller.quizComplete)
                Positioned(
                  left: 30,
                  right: 30,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    child: const Text('Magaling!', style: TextStyle(color: Color(0xFF00A765), fontWeight: FontWeight.w900)),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
