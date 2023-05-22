import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class ButtonKeterangan extends StatelessWidget {
  final IconData icons;
  final Color iconColors;
  final Color? bgColors;
  final Function()? onTap;
  final String? title;

  const ButtonKeterangan({
    super.key,
    required this.icons,
    required this.iconColors,
    this.bgColors,
    this.onTap,
    this.title = 'title',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(1.8),
              color: iconColors,
              child: ClipOval(
                child: Container(
                  color: bgColors ?? primaryExtraSoft,
                  child: Icon(
                    icons,
                    color: iconColors,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 14,
              fontWeight: medium,
              color: secondary.withOpacity(0.7),
            ),
          )
        ],
      ),
    );
  }
}
