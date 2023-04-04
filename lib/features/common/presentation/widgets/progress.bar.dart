import 'package:flutter/material.dart';
import 'package:majester_car_wash/core/extensions.dart';

/// custom progress bar
class AppProgressBar extends StatelessWidget {
  final double progress;
  const AppProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: LinearProgressIndicator(
          value: progress,
          minHeight: 10,
          valueColor: AlwaysStoppedAnimation(context.colorScheme.secondary),
          // color: context.theme.disabledColor,
          backgroundColor: context.theme.disabledColor,
        ),
      );
}
