import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class Scroller extends StatelessWidget {
  const Scroller({super.key});
  static List<String> scrollWords = [
    'beep boop',
    'dolby atmos',
    'max/msp',
    'vwɔˈʥ̑ĩmʲjɛʃ ʒuˈkɔfsʲci',
    'grandMA3',
    'dart',
    'touchdesigner',
    'ambisonic audio',
    'video art',
    'offset',
    'pyramid texts 436',
    'innermost',
    'concerto for quarter-tone hammond organ',
    'my private property',
    'K5(6)',
    'IT IS NO NIGHT TO DROWN IN',
    'an orange balloon drifting over snow-capped mountains',
    'postludium',
    'luna',
    'endsay',
    'ashling scattered over several provinces',
    'soundscapewalks'
  ]..shuffle();

  // helper method
  String _getScrollText(List<String> words, int skip, int take) {
    return words.skip(skip).take(take).join(' | ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextScroll(_getScrollText(scrollWords, 0, 20),
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(40, 0)),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        TextScroll(_getScrollText(scrollWords, 5, 22),
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(38, 0)),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        TextScroll(_getScrollText(scrollWords, 8, 27),
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(36, 0)),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        TextScroll(_getScrollText(scrollWords, 10, 30),
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(34, 0)),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        TextScroll(_getScrollText(scrollWords, 12, 26),
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(37, 0)),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        TextScroll(_getScrollText(scrollWords, 15, 34),
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(39, 0)),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
