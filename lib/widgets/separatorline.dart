import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';

class SeparatorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 8.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: dashWidth,
              height: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(color: CustomColor.whitePrimary),
              ),
            );
          }),
        );
      },
    );
  }
}