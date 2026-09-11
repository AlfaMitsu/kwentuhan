import 'dart:async';

import 'package:flutter/foundation.dart';

import 'data/story_data.dart';
import 'models/app_stage.dart';
import 'models/reader_state.dart';
import 'models/story.dart';
import 'services/music_service.dart';
import 'services/narration_service.dart';
import 'services/preferences_service.dart';

class AppController extends ChangeNotifier {
  AppController({
    PreferencesService? preferences,
    MusicService? music,
    NarrationService? narration,
  })  : _preferences = preferences ?? PreferencesService(),
        music = music ?? MusicService(),
        narration = narration ?? NarrationService();

  final PreferencesService _preferences;
  final MusicService music;
  final NarrationService narration;

  AppStage stage = AppStage.splash;
  final List<Story> allStories = stories;
  Set<String> likedStories = <String>{};
  Story? selectedStory;
  ReaderState reader = const ReaderState();
  int activeStory = 0;
  int quizQuestionIndex = 0;
  int? quizSelectedAnswer;
  QuizAnswerState quizAnswerState = QuizAnswerState.none;
  bool quizComplete = false;
  String searchQuery = '';
  double musicVolume = .55;
  double audioVolume = .55;
  bool isInitialized = false;

  Timer? _stageTimer;
  Timer? _sceneTimer;
  Timer? _quizTimer;

  List<Story> get visibleStories {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return allStories;
    return allStories
        .where((story) => story.title.toLowerCase().contains(query))
        .toList(growable: false);
  }

  bool isLiked(Story story) => likedStories.contains(story.title);

  Future<void> initialize() async {
    if (isInitialized) return;
    likedStories = await _preferences.loadLikedStories();
    try {
      await narration.initialize();
    } catch (_) {
      // The platform can still run the reader with its timed word reveal.
    }
    await music.initialize();
    isInitialized = true;
    notifyListeners();
    unawaited(music.play());
    _scheduleSplash();
  }

  void _scheduleSplash() {
    _stageTimer?.cancel();
    _stageTimer = Timer(const Duration(seconds: 1), () {
      stage = AppStage.loading;
      notifyListeners();
      _stageTimer = Timer(const Duration(milliseconds: 2800), () {
        stage = AppStage.welcome;
        notifyListeners();
      });
    });
  }

  void startIntro() {
    stage = AppStage.intro;
    notifyListeners();
  }

  void startStoryVideo() {
    stage = AppStage.story;
    notifyListeners();
  }

  void skipIntro() {
    stage = AppStage.storyLoading;
    notifyListeners();
    _scheduleStoryLoading();
  }

  void openStoryVideo() {
    stage = AppStage.storyLoading;
    notifyListeners();
    _scheduleStoryLoading();
  }

  void _scheduleStoryLoading() {
    _stageTimer?.cancel();
    _stageTimer = Timer(const Duration(seconds: 1), () {
      selectedStory = null;
      stage = AppStage.home;
      activeStory = 0;
      notifyListeners();
    });
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    activeStory = 0;
    notifyListeners();
  }

  void moveStory(int direction) {
    final count = visibleStories.length;
    if (count == 0) return;
    activeStory = (activeStory + direction + count) % count;
    notifyListeners();
  }

  void selectOrOpenStory(Story story, int index, {required bool armed}) {
    if (armed && activeStory == index) {
      openStory(story);
      return;
    }
    activeStory = index;
    notifyListeners();
  }

  void openStory(Story story) {
    unawaited(stopNarration());
    selectedStory = story;
    reader = const ReaderState();
    resetQuiz();
    stage = AppStage.storyReader;
    notifyListeners();
  }

  Future<void> toggleLike() async {
    final story = selectedStory;
    if (story == null) return;
    if (!likedStories.add(story.title)) {
      likedStories.remove(story.title);
    }
    notifyListeners();
    await _preferences.saveLikedStories(likedStories);
  }

  Future<void> startReading() async {
    if (selectedStory == null) return;
    await music.pause();
    await stopNarration();
    reader = reader.copyWith(
      sceneIndex: 0,
      wordIndex: -1,
      started: true,
      finished: false,
    );
    notifyListeners();
  }

  Future<void> stopNarration() => narration.stop();

  Future<void> skipCurrentScene() async {
    final story = selectedStory;
    if (story == null || !reader.started) return;
    await stopNarration();
    _sceneTimer?.cancel();
    if (reader.sceneIndex < story.scenes.length - 1) {
      reader = reader.copyWith(
        sceneIndex: reader.sceneIndex + 1,
        wordIndex: -1,
      );
      notifyListeners();
      return;
    }
    await finishReader();
  }

  Future<void> completeScene() async {
    final story = selectedStory;
    if (story == null || !reader.started) return;
    if (reader.sceneIndex < story.scenes.length - 1) {
      _sceneTimer?.cancel();
      _sceneTimer = Timer(const Duration(milliseconds: 650), () {
        reader = reader.copyWith(
          sceneIndex: reader.sceneIndex + 1,
          wordIndex: -1,
        );
        notifyListeners();
      });
      return;
    }
    await finishReader();
  }

  Future<void> finishReader() async {
    _sceneTimer?.cancel();
    await stopNarration();
    reader = reader.copyWith(started: false, finished: true, wordIndex: -1);
    notifyListeners();
    unawaited(music.play());
  }

  void setReaderWordIndex(int index) {
    if (reader.wordIndex == index) return;
    reader = reader.copyWith(wordIndex: index);
    notifyListeners();
  }

  Future<void> leaveStory() async {
    await stopNarration();
    _sceneTimer?.cancel();
    selectedStory = null;
    reader = const ReaderState();
    resetQuiz();
    stage = AppStage.home;
    notifyListeners();
    if (musicVolume > 0) unawaited(music.play());
  }

  void openQuiz() {
    if (selectedStory?.hasQuiz != true) return;
    unawaited(stopNarration());
    resetQuiz();
    stage = AppStage.quiz;
    notifyListeners();
  }

  void resetQuiz() {
    _quizTimer?.cancel();
    quizQuestionIndex = 0;
    quizSelectedAnswer = null;
    quizAnswerState = QuizAnswerState.none;
    quizComplete = false;
  }

  void answerQuiz(int answerIndex) {
    final quiz = selectedStory?.quiz;
    if (quiz == null || quizComplete || quizAnswerState == QuizAnswerState.correct) return;
    final question = quiz[quizQuestionIndex];
    quizSelectedAnswer = answerIndex;
    if (answerIndex != question.correctAnswer) {
      quizAnswerState = QuizAnswerState.wrong;
      notifyListeners();
      return;
    }
    quizAnswerState = QuizAnswerState.correct;
    notifyListeners();
    _quizTimer?.cancel();
    _quizTimer = Timer(const Duration(milliseconds: 650), () {
      if (quizQuestionIndex >= quiz.length - 1) {
        quizComplete = true;
        notifyListeners();
        _quizTimer = Timer(const Duration(milliseconds: 650), () {
          selectedStory = null;
          reader = const ReaderState();
          stage = AppStage.storyLoading;
          notifyListeners();
          _scheduleStoryLoading();
        });
        return;
      }
      quizQuestionIndex++;
      quizSelectedAnswer = null;
      quizAnswerState = QuizAnswerState.none;
      notifyListeners();
    });
  }

  void openSettings() {
    stage = AppStage.settings;
    notifyListeners();
  }

  void openAbout() {
    stage = AppStage.about;
    notifyListeners();
  }

  Future<void> backHome() async {
    await stopNarration();
    stage = AppStage.home;
    notifyListeners();
    if (musicVolume > 0) unawaited(music.play());
  }

  Future<void> setMusicVolume(double value) async {
    musicVolume = value.clamp(0, 1).toDouble();
    await music.setVolume(musicVolume);
    notifyListeners();
  }

  Future<void> setAudioVolume(double value) async {
    audioVolume = value.clamp(0, 1).toDouble();
    try {
      await narration.setVolume(audioVolume);
    } catch (_) {
      // The timed reveal remains available when a platform has no TTS volume API.
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _stageTimer?.cancel();
    _sceneTimer?.cancel();
    _quizTimer?.cancel();
    unawaited(narration.dispose());
    unawaited(music.dispose());
    super.dispose();
  }
}

enum QuizAnswerState { none, correct, wrong }
