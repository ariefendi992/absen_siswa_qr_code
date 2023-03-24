import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class FormInputWithIconWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData icons;
  final TextEditingController controller;
  final Function() onTap;
  final bool isSuffix;
  final bool passToggle;
  final bool obsecureText;
  final String Function(String? value) validator;

  const FormInputWithIconWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.icons,
    required this.controller,
    required this.onTap,
    required this.validator,
    this.isSuffix = false,
    this.passToggle = true,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: bold,
            color: kBlackColor.withOpacity(0.6),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 65,
          // margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.only(right: 12),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: kGreyBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26,
            //     blurRadius: 2,
            //     offset: Offset(0, 2),
            //   )
            // ],
          ),
          child: TextFormField(
            obscureText: obsecureText,
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.only(right: 15),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: medium,
                color: kGreyTextColor,
                fontSize: 14,
              ),
              prefixIcon: Icon(icons),
              suffixIcon: isSuffix
                  ? InkWell(
                      onTap: onTap,
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    )
                  : null,
            ),
            validator: validator,
          ),
        )
      ],
    );
  }
}
