import 'package:flutter/material.dart';
import 'package:music_app/models/vocabulary/vocabularies_section.dart';
import 'package:music_app/themes/app_colors.dart';

class GameButton extends StatelessWidget {
  final Text text;
  final VoidCallback? onPressed;
  final Color? color;
  final Gradient? gradient;
  final TextStyle? textStyle;
  final Icon? icon;
  final Color? borderColor;

  const GameButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.gradient,
    this.textStyle,
    this.icon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          gradient:
              gradient ??
              LinearGradient(
                colors: [color ?? AppColors.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          borderRadius: BorderRadius.circular(12),
          border:
              borderColor != null
                  ? Border(
                    bottom: BorderSide(color: borderColor!, width: 2.5),
                    right: BorderSide(color: borderColor!, width: 2.5),
                  )
                  : Border(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon ?? SizedBox(), text],
        ),
      ),
    );
  }
}
