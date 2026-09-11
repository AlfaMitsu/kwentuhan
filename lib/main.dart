import 'dart:async';

import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'models/app_stage.dart';
import 'screens/home_screen.dart';
import 'screens/media_screens.dart';
import 'screens/quiz_screen.dart';
import 'screens/story_reader_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = AppController();
  runApp(KwentuhanApp(controller: controller));
  unawaited(controller.initialize());
}

class KwentuhanApp extends StatefulWidget {
  const KwentuhanApp({required this.controller, super.key});

  final AppController controller;

  @override
  State<KwentuhanApp> createState() => _KwentuhanAppState();
}

class _KwentuhanAppState extends State<KwentuhanApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kwentuhan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, _) => _AppView(controller: widget.controller),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}

class _AppView extends StatelessWidget {
  const _AppView({required this.controller});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return switch (controller.stage) {
      AppStage.splash => const SplashScreen(loading: false),
      AppStage.loading => const SplashScreen(loading: true),
      AppStage.welcome => WelcomeScreen(controller: controller),
      AppStage.intro => IntroScreen(controller: controller),
      AppStage.story => StoryVideoScreen(controller: controller),
      AppStage.storyLoading => const StoryLoadingScreen(),
      AppStage.home => HomeScreen(controller: controller),
      AppStage.settings => SettingsScreen(controller: controller),
      AppStage.about => AboutScreen(controller: controller),
      AppStage.storyReader => StoryReaderScreen(controller: controller),
      AppStage.quiz => QuizScreen(controller: controller),
    };
  }
}
