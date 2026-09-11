import 'package:flutter/material.dart';

class StoryDialogue extends StatelessWidget {
  const StoryDialogue({
    required this.narration,
    required this.wordIndex,
    required this.isSpeaking,
    super.key,
  });

  final String narration;
  final int wordIndex;
  final bool isSpeaking;

  @override
  Widget build(BuildContext context) {
    final words = narration.trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList(growable: false);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: MediaQuery.sizeOf(context).height * .27,
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 52, 30, 14),
        decoration: const BoxDecoration(
          color: Color(0xFF9BDCFB),
          border: Border(top: BorderSide(color: Colors.white, width: 6)),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Row(
                children: <Widget>[
                  AnimatedScale(
                    scale: isSpeaking ? 1.08 : 1,
                    duration: const Duration(milliseconds: 180),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.volume_up_rounded, color: Color(0xFF58B9E5), size: 23),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Tagapagsalaysay',
                    style: TextStyle(
                      color: const Color(0xFF168DBA),
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      shadows: isSpeaking ? const <Shadow>[Shadow(color: Colors.white, blurRadius: 3)] : null,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 40,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: List<Widget>.generate(words.length, (index) {
                    final visible = index <= wordIndex;
                    return AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 160),
                      style: TextStyle(
                        color: visible ? (index == wordIndex ? const Color(0xFF086FA5) : const Color(0xFF172533)) : Colors.transparent,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        height: 1.32,
                      ),
                      child: Text(words[index]),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
