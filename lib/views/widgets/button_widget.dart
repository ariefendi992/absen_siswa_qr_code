import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final margin;
  final Function() onTap;
  final Color? colors;
  final double borderRadiusCircular;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 55,
    this.width = double.infinity,
    this.fontSize = 22,
    this.margin = EdgeInsets.zero,
    this.colors,
    this.borderRadiusCircular = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadiusCircular),
      color: colors == null ? kPrimaryColor : colors,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                color: kWhiteColor,
                fontWeight: medium,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
