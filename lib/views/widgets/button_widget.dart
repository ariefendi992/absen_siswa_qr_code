import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function()? onTap;
  final Color? colors;
  final double borderRadiusCircular;
  final double elevation;
  final IconData? icons;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 55,
    this.width = double.infinity,
    this.fontSize = 22,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.colors,
    this.borderRadiusCircular = 10,
    this.elevation = 5,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadiusCircular),
        elevation: elevation,
        color: colors ?? kPrimaryColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: kWhiteColor,
                    fontWeight: medium,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  icons,
                  color: kWhiteColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
