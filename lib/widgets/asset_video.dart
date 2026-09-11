import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetVideo extends StatefulWidget {
  const AssetVideo({
    required this.asset,
    this.loop = false,
    this.fit = BoxFit.fill,
    this.onEnded,
    this.initialPosition,
    this.repeatFrom,
    super.key,
  });

  final String asset;
  final bool loop;
  final BoxFit fit;
  final VoidCallback? onEnded;
  final Duration? initialPosition;
  final Duration? repeatFrom;

  @override
  State<AssetVideo> createState() => _AssetVideoState();
}

class _AssetVideoState extends State<AssetVideo> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)
      ..addListener(_onChanged)
      ..initialize().then((_) async {
        if (!mounted) return;
        if (widget.initialPosition != null) {
          await _controller.seekTo(widget.initialPosition!);
        }
        await _controller.setLooping(widget.loop);
        await _controller.play();
        if (mounted) setState(() {});
      });
  }

  void _onChanged() {
    if (!mounted || !_controller.value.isInitialized || widget.loop) return;
    final value = _controller.value;
    if (value.position >= value.duration && !value.isPlaying) {
      if (widget.repeatFrom != null) {
        _controller.seekTo(widget.repeatFrom!);
        _controller.play();
        return;
      }
      widget.onEnded?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const ColoredBox(color: Color(0xFF9BDCFB));
    }
    return FittedBox(
      fit: widget.fit,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: _controller.value.size.width,
        height: _controller.value.size.height,
        child: VideoPlayer(_controller),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }
}
