import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownTextFormWidget extends StatelessWidget {
  final Widget? hint;
  final bool isDense;
  final bool isExpanded;
  final List<DropdownMenuItem<String>>? items;
  final String label;
  final Color? labelColor;
  final EdgeInsets margin;
  final Function(dynamic)? onChange;
  final TextStyle? style;
  final String? value;

  const DropDownTextFormWidget({
    super.key,
    this.hint,
    this.isDense = true,
    required this.label,
    this.items,
    this.isExpanded = true,
    this.labelColor,
    this.margin = EdgeInsets.zero,
    this.value,
    this.onChange,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
                color: labelColor ?? secondary.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 44,
            padding: EdgeInsets.only(
              right: 14,
              top: 12,
              bottom: 8,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kWhiteColor,
              border: Border.all(
                width: 1.5,
                color: secondarySoft,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: isDense,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              hint: hint,
              isExpanded: isExpanded,
              items: items,
              onChanged: onChange,
              style: style,
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
