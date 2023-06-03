import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class CardWithBorDerWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? colorIcon;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function()? onTap;
  final BorderSide? topBorder;
  final BorderSide? bottomBorder;
  final Color? bgColorIconLeft;

  const CardWithBorDerWidget({
    super.key,
    required this.title,
    this.onTap,
    this.titleColor,
    this.colorIcon,
    this.topBorder,
    this.bottomBorder,
    this.leftIcon,
    this.rightIcon,
    this.bgColorIconLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide.none,
          right: BorderSide.none,
          top: topBorder ??
              BorderSide(
                color: secondaryExtraSoft,
                width: 1,
              ),
          bottom: bottomBorder ??
              BorderSide(
                color: secondaryExtraSoft,
                width: 1.5,
              ),
        ),
      ),
      child: Row(
        children: [
          // customIcon  ??
          //     CustomIconWidget(
          //       icon: Icons.person_rounded,
          //       colorIcon: colorIcon,
          //     ),
          CustomIconWidget(
            borderColor: colorIcon,
            backgroundColor: bgColorIconLeft,
            icon: leftIcon ?? Icons.person_rounded,
            colorIcon: colorIcon ?? primary,
          ),
          SizedBox(width: 26),
          Text(
            title,
            style: TextStyle(
              color: titleColor ?? secondary,
              fontSize: 15,
              fontWeight: medium,
            ),
          ),
          Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: onTap,
            child: Container(
              height: 44,
              width: 44,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              alignment: Alignment.center,
              child: Icon(
                rightIcon ?? Icons.arrow_forward_ios_rounded,
                color: colorIcon ?? primary,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
