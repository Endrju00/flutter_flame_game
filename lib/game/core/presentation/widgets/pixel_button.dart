import 'package:flutter/material.dart';

class PixelButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Widget? icon;

  const PixelButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320, minWidth: 200),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (icon != null)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: icon,
                  ),
                ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'PixelifySans',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
