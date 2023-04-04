import 'package:flutter/material.dart';
import 'package:majester_car_wash/core/extensions.dart';

/// custom button
class AppButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final bool isOutlined;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isOutlined = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isOutlined ? null : context.colorScheme.primary,
            border: Border.all(color: context.colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            mainAxisSize: icon == null ? MainAxisSize.min : MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: icon == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              // label of the button
              Text(
                label,
                style: context.textTheme.button?.copyWith(
                    color: isOutlined
                        ? context.colorScheme.primary
                        : context.colorScheme.onPrimary),
              ),

              // icon
              if (icon != null) ...{
                Icon(
                  Icons.add_circle_outline,
                  color: isOutlined
                      ? context.colorScheme.primary
                      : context.colorScheme.onPrimary,
                ),
              },
            ],
          ),
        ),
      );
}
