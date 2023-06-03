import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  final IconData icon;
  final double borderWidth;
  final double paddingSize;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? colorIcon;
  final double iconSize;

  const CustomIconWidget({
    super.key,
    required this.icon,
    this.colorIcon,
    this.borderWidth = 1.2,
    this.backgroundColor,
    this.paddingSize = 5,
    this.borderColor,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(color: borderColor ?? primarySoft),
        child: ClipOval(
          child: Container(
            padding: EdgeInsets.all(paddingSize),
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: backgroundColor ?? primaryExtraSoft),
            child: Icon(
              icon,
              color: colorIcon ?? primary,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
