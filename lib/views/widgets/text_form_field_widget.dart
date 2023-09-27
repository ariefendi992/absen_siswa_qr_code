import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? labelColor;
  final Color? borderColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final Function()? onTap;

  const TextFormWidget({
    super.key,
    this.controller,
    required this.label,
    this.labelColor,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 8.0,
    this.borderColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.readOnly = false,
    this.suffixIcon,
    this.textInputType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: medium,
                color: labelColor ?? secondary.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 44,
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
              // top: 12,
              // bottom: 8,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(
                  color: borderColor ?? secondarySoft,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(borderRadius)),
            child: TextFormField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                hintText: hintText,
                hintStyle: hintStyle,
                labelText: labelText,
                // icon: Icon(Icons.),
                suffixIcon: suffixIcon,
              ),
              readOnly: readOnly,
              keyboardType: textInputType,
              style: TextStyle(
                fontSize: 14,
                color: readOnly ? secondary : secondary,
                // color: readOnly ? secondary.withOpacity(0.5) : secondary,
              ),
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
