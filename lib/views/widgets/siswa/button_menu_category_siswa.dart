import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonCardMenuKategori extends StatelessWidget {
  final Widget title; // * Text()
  final IconData? faIcon; // * FontAwesome
  final Color? iconColor;
  final Color? bgIconColor;
  final Color? bgCard;
  final Function()? onTap;

  const ButtonCardMenuKategori({
    super.key,
    required this.title,
    this.faIcon,
    this.iconColor,
    this.bgIconColor,
    this.bgCard,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 105,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: bgCard ?? Color(0XFFEBF1FF),
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgIconColor ?? primaryColor2.withOpacity(0.7),
              ),
              child: Center(
                child: FaIcon(
                  faIcon ?? FontAwesomeIcons.book,
                  size: 26,
                  color: iconColor ?? secondaryPrimary,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              child: title,
            )
          ],
        ),
      ),
    );
  }
}
