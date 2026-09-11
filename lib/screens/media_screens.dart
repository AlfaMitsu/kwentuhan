import 'package:flutter/material.dart';

import '../app_controller.dart';
import '../models/story.dart';
import '../widgets/asset_video.dart';
import '../widgets/portrait_frame.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({required this.loading, super.key});

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(assetPath('/kwentuhan-logo.png'), width: 290, fit: BoxFit.contain),
          if (loading)
            const Positioned(
              left: 52,
              right: 52,
              bottom: 74,
              child: _LoadingTrack(),
            ),
        ],
      ),
    );
  }
}

class _LoadingTrack extends StatelessWidget {
  const _LoadingTrack();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: <Widget>[
            Container(decoration: BoxDecoration(border: Border.all(color: const Color(0xFF79CCEF), width: 3), color: Colors.white)),
            FractionallySizedBox(
              widthFactor: .88,
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: const Color(0xFF8BD4F5), borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const Positioned(left: 12, top: 3, child: _RunnerDog()),
          ],
        ),
      ),
    );
  }
}

class _RunnerDog extends StatelessWidget {
  const _RunnerDog();

  @override
  Widget build(BuildContext context) => Image.asset(assetPath('/running-dog-transparent.webp'), width: 32, height: 24, fit: BoxFit.contain);
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({required this.controller, super.key});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AssetVideo(
            asset: assetPath('/kwentuhan-welcome.mp4'),
            initialPosition: const Duration(milliseconds: 1400),
            repeatFrom: const Duration(milliseconds: 1400),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.sizeOf(context).height * .785,
            height: 70,
            child: Semantics(
              button: true,
              label: 'Start Kwentuhan',
              child: GestureDetector(onTap: controller.startIntro, child: const SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({required this.controller, super.key});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AssetVideo(asset: assetPath('/kwentuhan-intro.mp4')),
          Positioned(
            left: 0,
            top: 0,
            width: 180,
            height: 70,
            child: Semantics(
              button: true,
              label: 'Skip intro',
              child: GestureDetector(onTap: controller.skipIntro, child: const SizedBox.expand()),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            width: 95,
            height: 110,
            child: Semantics(
              button: true,
              label: 'Play and continue',
              child: GestureDetector(onTap: controller.startStoryVideo, child: const SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryVideoScreen extends StatelessWidget {
  const StoryVideoScreen({required this.controller, super.key});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AssetVideo(asset: assetPath('/kwentuhan-story.mp4')),
          Positioned(
            right: 0,
            bottom: 0,
            width: 95,
            height: 110,
            child: Semantics(
              button: true,
              label: 'Continue story',
              child: GestureDetector(onTap: controller.openStoryVideo, child: const SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryLoadingScreen extends StatelessWidget {
  const StoryLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      background: const Color(0xFF8FD3D4),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AssetVideo(asset: assetPath('/kwentuhan-story-loading.mp4')),
          const Positioned(left: 52, right: 52, bottom: 74, child: _LoadingTrack()),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({required this.controller, super.key});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(assetPath('/kwentuhan-settings-clean.png'), fit: BoxFit.fill),
          Positioned(
            left: 74,
            right: 74,
            top: 0,
            height: 360,
            child: _VolumeSlider(value: controller.musicVolume, onChanged: controller.setMusicVolume),
          ),
          Positioned(
            left: 74,
            right: 74,
            top: 0,
            height: 360,
            child: Align(
              alignment: const Alignment(0, .83),
              child: _VolumeSlider(value: controller.audioVolume, onChanged: (value) async {
                controller.setAudioVolume(value);
              }),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            width: 100,
            height: 110,
            child: Semantics(
              button: true,
              label: 'Back to home',
              child: GestureDetector(onTap: controller.backHome, child: const SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }
}

class _VolumeSlider extends StatelessWidget {
  const _VolumeSlider({required this.value, required this.onChanged});

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 30,
        activeTrackColor: const Color(0xFF97D8F6),
        inactiveTrackColor: const Color(0xFFFFE1BF),
        thumbColor: const Color(0xFF1471B6),
        overlayColor: Colors.transparent,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 27),
      ),
      child: RotatedBox(
        quarterTurns: 0,
        child: Slider(value: value, onChanged: onChanged),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({required this.controller, super.key});

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return PortraitFrame(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(assetPath('/kwentuhan-about.png'), fit: BoxFit.fill),
          Positioned(
            left: 0,
            bottom: 0,
            width: 100,
            height: 110,
            child: Semantics(
              button: true,
              label: 'Back to home',
              child: GestureDetector(onTap: controller.backHome, child: const SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }
}
