import 'dart:async';

import 'package:flutter/material.dart';

import '../app_controller.dart';
import '../models/story.dart';
import '../theme/app_theme.dart';
import '../widgets/portrait_frame.dart';
import '../widgets/story_dialogue.dart';

class StoryReaderScreen extends StatefulWidget {
  const StoryReaderScreen({required this.controller, super.key});

  final AppController controller;

  @override
  State<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen>
    with SingleTickerProviderStateMixin {
  Timer? _fallbackTimer;
  int _sceneBeingRead = -1;
  int _generation = 0;
  bool _speechFailed = false;
  late final AnimationController _dogController;

  AppController get controller => widget.controller;
  Story? get story => controller.selectedStory;

  @override
  void initState() {
    super.initState();
    controller.addListener(_handleControllerChange);
    _dogController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleControllerChange());
  }

  void _handleControllerChange() {
    final currentStory = story;
    if (currentStory == null) return;
    if (!controller.reader.started) {
      _fallbackTimer?.cancel();
      return;
    }
    final sceneIndex = controller.reader.sceneIndex;
    if (_sceneBeingRead == sceneIndex) return;
    _sceneBeingRead = sceneIndex;
    if (currentStory.finalCard != null && sceneIndex == currentStory.scenes.length - 1) {
      unawaited(controller.finishReader());
      return;
    }
    _startNarration(currentStory.scenes[sceneIndex]);
  }

  Future<void> _startNarration(StoryScene scene) async {
    final generation = ++_generation;
    _fallbackTimer?.cancel();
    _speechFailed = false;
    controller.setReaderWordIndex(-1);
    final words = scene.narration.trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList(growable: false);
    if (words.isEmpty) {
      await controller.completeScene();
      return;
    }

    void finishFallback() {
      if (generation != _generation || !_speechFailed) return;
      _fallbackTimer?.cancel();
      controller.setReaderWordIndex(words.length - 1);
      unawaited(controller.completeScene());
    }

    _fallbackTimer = Timer.periodic(const Duration(milliseconds: 330), (_) {
      if (generation != _generation || !controller.reader.started) return;
      final next = (controller.reader.wordIndex + 1).clamp(0, words.length - 1).toInt();
      controller.setReaderWordIndex(next);
      if (next == words.length - 1) finishFallback();
    });

    await controller.narration.speak(
      scene.narration,
      onWord: (characterIndex) {
        if (generation != _generation || !mounted) return;
        _speechFailed = false;
        _fallbackTimer?.cancel();
        final spoken = scene.narration.substring(0, characterIndex.clamp(0, scene.narration.length).toInt()).trim();
        final spokenCount = spoken.isEmpty ? 0 : spoken.split(RegExp(r'\s+')).length;
        controller.setReaderWordIndex((spokenCount - 1).clamp(0, words.length - 1).toInt());
      },
      onComplete: () {
        if (generation != _generation || !mounted) return;
        _fallbackTimer?.cancel();
        controller.setReaderWordIndex(words.length - 1);
        unawaited(controller.completeScene());
      },
      onError: () {
        if (generation != _generation || !mounted) return;
        _speechFailed = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = story;
    if (currentStory == null) return const SizedBox.shrink();
    final reader = controller.reader;
    if (!reader.started && !reader.finished) return _buildStartScreen(currentStory);
    return _buildReaderScreen(currentStory);
  }

  Widget _buildStartScreen(Story currentStory) {
    return PortraitFrame(
      background: const Color(0xFFCAEAFA),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (currentStory.cover != null)
            Image.asset(assetPath(currentStory.cover!), fit: BoxFit.fill)
          else
            Image.asset(assetPath(currentStory.image), fit: BoxFit.fill),
          Positioned(
            left: 12,
            bottom: 25,
            width: 86,
            height: 74,
            child: Semantics(
              button: true,
              label: 'Back to stories',
              child: GestureDetector(onTap: controller.leaveStory, child: const SizedBox.expand()),
            ),
          ),
          Positioned(
            left: 105,
            bottom: 24,
            width: 54,
            height: 54,
            child: _FavoriteOverlayButton(isLiked: controller.isLiked(currentStory), onPressed: controller.toggleLike),
          ),
          Positioned(
            left: 175,
            right: 10,
            bottom: 24,
            height: 74,
            child: Semantics(
              button: true,
              label: 'Basahin ${currentStory.title}',
              child: GestureDetector(onTap: controller.startReading, child: const SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReaderScreen(Story currentStory) {
    final reader = controller.reader;
    final scene = currentStory.scenes[reader.sceneIndex];
    final finalCard = currentStory.finalCard != null && reader.sceneIndex == currentStory.scenes.length - 1;
    return PortraitFrame(
      background: const Color(0xFF163C59),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (finalCard)
                _buildFinalCard(currentStory, scene, constraints)
              else
                Image.asset(assetPath(scene.image), fit: BoxFit.fill),
              if (!finalCard)
                StoryDialogue(
                  narration: scene.narration,
                  wordIndex: reader.wordIndex,
                  isSpeaking: reader.started && reader.wordIndex >= 0,
                ),
              if (reader.started && !finalCard)
                Positioned(
                  top: 18,
                  right: 14,
                  child: OutlinedButton(
                    onPressed: () => unawaited(controller.skipCurrentScene()),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      backgroundColor: const Color(0xCC12334D),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                      textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                    ),
                    child: const Text('Laktawan'),
                  ),
                ),
              if (finalCard)
                Positioned(
                  left: constraints.maxWidth * .28,
                  right: constraints.maxWidth * .28,
                  top: constraints.maxHeight * .69,
                  height: constraints.maxHeight * .16,
                  child: Semantics(
                    button: true,
                    label: currentStory.hasQuiz ? 'Start quiz' : 'Return to stories',
                    child: GestureDetector(
                      onTap: currentStory.hasQuiz ? controller.openQuiz : controller.leaveStory,
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
              if (reader.finished && !finalCard)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 8,
                  child: Center(
                    child: FilledButton(
                      onPressed: controller.leaveStory,
                      style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppTheme.deepBrown),
                      child: const Text('Bumalik sa mga kuwento'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFinalCard(Story currentStory, StoryScene scene, BoxConstraints constraints) {
    final finalCard = currentStory.finalCard!;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(assetPath(finalCard.background), fit: BoxFit.fill),
        AnimatedBuilder(
          animation: _dogController,
          builder: (context, child) {
            final offset = (_dogController.value - .5) * 8;
            return Positioned(
              left: constraints.maxWidth * .382,
              top: constraints.maxHeight * .606 + offset,
              width: constraints.maxWidth * .239,
              height: constraints.maxHeight * .123,
              child: child!,
            );
          },
          child: Image.asset(assetPath(finalCard.dog), fit: BoxFit.fill),
        ),
        Positioned(
          left: constraints.maxWidth * .07,
          right: constraints.maxWidth * .07,
          top: constraints.maxHeight * .352,
          child: Text(
            scene.narration,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'Georgia', fontSize: 21, fontWeight: FontWeight.w700, height: 1.34, color: Colors.black),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.removeListener(_handleControllerChange);
    _generation++;
    _fallbackTimer?.cancel();
    _dogController.dispose();
    super.dispose();
  }
}

class _FavoriteOverlayButton extends StatelessWidget {
  const _FavoriteOverlayButton({required this.isLiked, required this.onPressed});

  final bool isLiked;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      toggled: isLiked,
      label: isLiked ? 'Unheart story' : 'Heart story',
      child: IconButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.favorite, color: isLiked ? const Color(0xFFF0445D) : Colors.transparent, size: 34),
      ),
    );
  }
}
