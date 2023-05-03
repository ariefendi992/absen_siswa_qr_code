import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class MapelCardWiget extends StatelessWidget {
  final MapelSiswaModel mapels;
  final Color bgColor;

  const MapelCardWiget(
    this.mapels, {
    super.key,
    this.bgColor = const Color(0XFF0429B3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 8, right: 8),
      child: Material(
        // color: kGreenColor,
        color: kPrimaryColor.withOpacity(0.7),
        elevation: 6,
        borderRadius: BorderRadius.circular(18),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(top: 5.5, left: 20, right: 20, bottom: 5.5),
              child: Row(
                children: [
                  Text(
                    'Mata Pelajaran',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: bold,
                        letterSpacing: 0.8),
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  // Text(
                  //   'Mata Pelajaran',
                  //   style: TextStyle(
                  //     color: kBlackColor,
                  //     fontWeight: medium,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // Divider(
                  //   height: 2,
                  //   thickness: 1.2,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: kBlackColor.withOpacity(0.4),
                  // ),
                  // SizedBox(height: 6),
                  Text(
                    '${mapels.mapel}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: semiBold,
                        color: kBlackColor,
                        letterSpacing: 0.4),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Divider(
                    indent: 2,
                    endIndent: 2,
                    height: 2,
                    thickness: 1,
                    color: kBlackColor.withOpacity(0.4),
                  ),
                  SizedBox(height: 1),
                  Divider(
                    indent: 2,
                    endIndent: 2,
                    height: 2,
                    thickness: 2.0,
                    color: kBlackColor.withOpacity(0.4),
                  ),
                  SizedBox(height: 5),
                  // Text(
                  //   'Nama Guru',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: medium,
                  //     color: kBlackColor,
                  //   ),
                  // ),
                  // Divider(
                  //   height: 2,
                  //   thickness: 1.2,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: kBlackColor.withOpacity(0.4),
                  // ),
                  Text(
                    '${mapels.namaGuru}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: semiBold,
                        color: kBlackColor,
                        letterSpacing: 0.4),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
