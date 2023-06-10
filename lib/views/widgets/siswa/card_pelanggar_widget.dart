import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPelanggaranWidget extends StatelessWidget {
  const CardPelanggaranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 8, bottom: 18),
      child: Material(
        elevation: 5,
        shadowColor: primaryExtraSoft,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Point Terbanyak Ke-1',
                style: TextStyle(
                  color: allColor[7],
                  fontWeight: medium,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Icon(
                      CupertinoIcons.exclamationmark_circle_fill,
                      color: warning,
                      size: 32,
                    ),
                  ),
                  Text(
                    '15',
                    style: TextStyle(
                      color: allColor[7],
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Ananda Putri Aurelia Akbar',
                style: TextStyle(
                  color: allColor[7],
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
