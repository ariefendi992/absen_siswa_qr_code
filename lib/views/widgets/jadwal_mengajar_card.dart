import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class JadwalMengajarCard extends StatelessWidget {
  // final JadwalMengajarHariModel? jadwalHari;
  // final JadwalMengajarSelasaModel? jadwalSelasa;
  final String hari;
  final String jamMulai;
  final String jamSelesai;
  final String kelas;
  final String mapel;
  JadwalMengajarCard({
    super.key,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
    required this.kelas,
    required this.mapel,
  });

  @override
  Widget build(BuildContext context) {
    final lines = [20.0, 30.0, 40.0, 10.0];

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return Container(
                  height: 2,
                  color: secondarySoft,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: lines[index],
                );
              },
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(18),
              child: Container(
                // height: 100,
                decoration: BoxDecoration(
                  color: primaryExtraSoft,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 4),
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 2,
                    top: 14,
                    bottom: 24,
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    image: DecorationImage(
                      image: AssetImage('assets/images/pattern-2.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                      bottomLeft: Radius.circular(14),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${hari.toUpperCase()}',
                        style: TextStyle(
                          fontWeight: medium,
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              '$jamMulai - $jamSelesai',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: medium,
                                color: kWhiteColor,
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1.2,
                              color: secondarySoft,
                              indent: 2,
                              endIndent: 2,
                              width: 20,
                            ),
                            Text(
                              'Kelas : $kelas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: medium,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$mapel',
                              style: TextStyle(
                                fontSize: 18.5,
                                fontWeight: bold,
                                letterSpacing: 0.3,
                                color: kWhiteColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
