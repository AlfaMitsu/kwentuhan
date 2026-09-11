import 'package:flutter_tts/flutter_tts.dart';

typedef WordProgress = void Function(int characterIndex);

class NarrationService {
  NarrationService() : _tts = FlutterTts();

  final FlutterTts _tts;
  int _generation = 0;
  double _volume = .55;

  Future<void> initialize() async {
    await _tts.setLanguage('fil-PH');
    await _tts.setSpeechRate(.43);
    await _tts.setPitch(1.08);
    await _tts.setVolume(_volume);
    await _tts.awaitSpeakCompletion(true);
  }

  Future<void> setVolume(double value) async {
    _volume = value.clamp(0, 1).toDouble();
    await _tts.setVolume(_volume);
  }

  Future<void> speak(
    String text, {
    required WordProgress onWord,
    required void Function() onComplete,
    required void Function() onError,
  }) async {
    final generation = ++_generation;
    await _tts.setLanguage('fil-PH');
    await _tts.setVolume(_volume);
    await _tts.setProgressHandler((_, start, __, ___) {
      if (generation == _generation) onWord(start);
    });
    await _tts.setCompletionHandler(() {
      if (generation == _generation) onComplete();
    });
    await _tts.setErrorHandler((_) {
      if (generation == _generation) onError();
    });
    try {
      await _tts.speak(text);
    } catch (_) {
      if (generation == _generation) onError();
    }
  }

  Future<void> stop() async {
    _generation++;
    await _tts.stop();
  }

  Future<void> dispose() async {
    _generation++;
    await _tts.stop();
  }
}
