import 'package:audioplayers/audioplayers.dart';

class MusicService {
  MusicService() : _player = AudioPlayer();

  final AudioPlayer _player;
  double _volume = .55;
  bool _ready = false;

  double get volume => _volume;

  Future<void> initialize() async {
    try {
      await _player.setReleaseMode(ReleaseMode.loop);
      await _player.setSource(AssetSource('morning-mood.mp3'));
      _ready = true;
    } catch (_) {
      _ready = false;
    }
  }

  Future<void> play() async {
    if (!_ready) return;
    await _player.setVolume(_volume);
    await _player.resume();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> setVolume(double value) async {
    _volume = value.clamp(0, 1).toDouble();
    await _player.setVolume(_volume);
  }

  Future<void> dispose() async {
    _ready = false;
    await _player.dispose();
  }
}
