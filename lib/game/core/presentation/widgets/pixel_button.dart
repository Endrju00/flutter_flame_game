import 'package:flutter/material.dart';

class PixelButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Function()? onPressed;
  final Widget? icon;

  const PixelButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320, minWidth: 240),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null) icon!,
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PixelifySans',
                  fontSize: fontSize,
                  color: Colors.white,
                ),
              ),
              Container(width: 22),
            ],
          ),
        ),
      ),
    );
  }
}
