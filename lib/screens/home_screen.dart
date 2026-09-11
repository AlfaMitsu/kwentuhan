import 'package:flutter/material.dart';

import '../app_controller.dart';
import '../models/story.dart';
import '../theme/app_theme.dart';
import '../widgets/asset_video.dart';
import '../widgets/portrait_frame.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.controller, super.key});

  final AppController controller;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _armedStory;
  Offset? _swipeStart;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  bool _searchFocused = false;

  AppController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: controller.searchQuery);
    _searchFocusNode = FocusNode()..addListener(_onSearchFocusChanged);
  }

  void _onSearchFocusChanged() {
    if (mounted) setState(() => _searchFocused = _searchFocusNode.hasFocus);
  }

  void _tapStory(Story story, int index) {
    final armed = _armedStory == index && controller.activeStory == index;
    controller.selectOrOpenStory(story, index, armed: armed);
    setState(() => _armedStory = armed ? null : index);
  }

  @override
  Widget build(BuildContext context) {
    final visible = controller.visibleStories;
    if (_searchController.text != controller.searchQuery) {
      _searchController.value = TextEditingValue(
        text: controller.searchQuery,
        selection: TextSelection.collapsed(offset: controller.searchQuery.length),
      );
    }
    return PortraitFrame(
      background: AppTheme.deepBrown,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              const Positioned.fill(child: AssetVideo(asset: 'assets/kwentuhan-home.mp4', loop: true)),
              Positioned(
                left: constraints.maxWidth * .15,
                top: constraints.maxHeight * .028,
                width: constraints.maxWidth * .49,
                height: constraints.maxHeight * .058,
                child: TextField(
                  key: const ValueKey('story-search'),
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  onChanged: controller.setSearchQuery,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                  cursorColor: AppTheme.blue,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  ),
                ),
              ),
              if (_searchFocused)
                Positioned(
                  left: constraints.maxWidth * .10,
                  right: constraints.maxWidth * .23,
                  top: constraints.maxHeight * .082,
                  height: constraints.maxHeight * .29,
                  child: Material(
                    color: Colors.white,
                    elevation: 10,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: visible
                          .map(
                            (story) => ListTile(
                              dense: true,
                              title: Text(story.title, style: const TextStyle(color: AppTheme.deepBrown, fontWeight: FontWeight.w800)),
                              onTap: () {
                                _searchController.text = story.title;
                                controller.setSearchQuery(story.title);
                                _searchFocusNode.unfocus();
                              },
                            ),
                          )
                          .toList(growable: false),
                    ),
                  ),
                ),
              Positioned(
                right: constraints.maxWidth * .22,
                top: constraints.maxHeight * .029,
                width: constraints.maxWidth * .1,
                height: constraints.maxHeight * .06,
                child: Semantics(
                  button: true,
                  label: 'Microphone',
                  child: GestureDetector(onTap: () {}, child: const SizedBox.expand()),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                width: constraints.maxWidth * .26,
                height: constraints.maxHeight * .1,
                child: Semantics(
                  button: true,
                  label: 'Open music and audio settings',
                  child: GestureDetector(onTap: controller.openSettings, child: const SizedBox.expand()),
                ),
              ),
              Positioned(
                right: constraints.maxWidth * .04,
                top: constraints.maxHeight * .08,
                width: constraints.maxWidth * .27,
                height: constraints.maxHeight * .16,
                child: Semantics(
                  button: true,
                  label: 'About Kwentuhan',
                  child: GestureDetector(onTap: controller.openAbout, child: const SizedBox.expand()),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: constraints.maxHeight * .49,
                bottom: constraints.maxHeight * .08,
                child: GestureDetector(
                  onHorizontalDragStart: (details) => _swipeStart = details.localPosition,
                  onHorizontalDragEnd: (details) {
                    final start = _swipeStart;
                    _swipeStart = null;
                    if (start == null) return;
                    final end = details.primaryVelocity ?? 0;
                    if (end.abs() > 100) controller.moveStory(end < 0 ? 1 : -1);
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      const Positioned.fill(child: ColoredBox(color: AppTheme.deepBrown)),
                      for (var index = 0; index < visible.length; index++) _storyChoice(context, visible, index, constraints),
                      if (visible.isEmpty) const Center(child: _NoStories()),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode
      ..removeListener(_onSearchFocusChanged)
      ..dispose();
    super.dispose();
  }

  Widget _storyChoice(BuildContext context, List<Story> visible, int index, BoxConstraints constraints) {
    final story = visible[index];
    final count = visible.length;
    final active = count == 0 ? 0 : controller.activeStory % count;
    final position = index == active
        ? _StoryPosition.center
        : index == (active - 1 + count) % count
            ? _StoryPosition.left
            : index == (active + 1) % count
                ? _StoryPosition.right
                : _StoryPosition.hidden;
    final size = constraints.maxWidth * .82;
    final left = switch (position) {
      _StoryPosition.center => (constraints.maxWidth - size) / 2,
      _StoryPosition.left => -size * .24,
      _StoryPosition.right => constraints.maxWidth - size * .76,
      _StoryPosition.hidden => (constraints.maxWidth - size) / 2,
    };
    final top = position == _StoryPosition.center
        ? -size * .09
        : position == _StoryPosition.hidden
            ? size * .25
            : size * .13;
    final scale = position == _StoryPosition.center
        ? 1.0
        : position == _StoryPosition.hidden
            ? .5
            : .62;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOut,
      left: left,
      top: top,
      width: size,
      height: size,
      child: IgnorePointer(
        ignoring: position == _StoryPosition.hidden,
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 380),
          child: GestureDetector(
            onTap: () => _tapStory(story, index),
            child: Semantics(
              button: true,
              label: '${story.title}. Tap once to choose this story and tap again to open it',
              child: DecoratedBox(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipOval(child: Image.asset(assetPath(story.image), fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _StoryPosition { center, left, right, hidden }

class _NoStories extends StatelessWidget {
  const _NoStories();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Walang nakitang kuwento', style: TextStyle(color: AppTheme.deepBrown, fontWeight: FontWeight.w900, fontSize: 18)),
          SizedBox(height: 8),
          Text('Subukan ang ibang salita.', style: TextStyle(color: AppTheme.deepBrown)),
        ],
      ),
    );
  }
}
