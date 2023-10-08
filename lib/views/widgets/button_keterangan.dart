import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class ButtonMenuKeterangan extends StatelessWidget {
  final IconData icons;
  final Color iconColors;
  final Color? bgColors;
  final Function()? onTap;
  final String? title;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;

  const ButtonMenuKeterangan({
    super.key,
    this.bgColors,
    this.fontColor,
    this.fontWeight,
    this.fontSize = 14,
    this.height = 40,
    required this.icons,
    required this.iconColors,
    this.iconSize = 26,
    this.onTap,
    this.title = 'title',
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.all(1.8),
              color: iconColors,
              child: ClipOval(
                child: Container(
                  color: bgColors ?? primaryExtraSoft,
                  child: Icon(
                    icons,
                    color: iconColors,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(
            '$title',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight ?? medium,
              color: fontColor ?? secondary.withOpacity(0.7),
            ),
          )
        ],
      ),
    );
  }
}
