import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class JadwalMapelCard extends StatelessWidget {
  final JadwalMengajarHarianModel? jadwal;
  final Color? colors;
  const JadwalMapelCard({
    super.key,
    this.jadwal,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(18),
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: colors ?? primary,
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage('assets/images/pattern-2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    widthFactor: MediaQuery.of(context).size.width,
                    child: Text(
                      '${jadwal!.today}',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            'Kelas',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              // fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          // fontSize: 16,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${jadwal!.kelas}',
                            style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: medium,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 12),
                  Divider(
                    thickness: 1,
                    height: 8.5,
                    color: kWhiteColor.withAlpha(100),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            'MataPelajaran',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              // fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          // fontSize: 16,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${jadwal!.mapel}',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              // fontSize: 16,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    height: 8.5,
                    color: kWhiteColor.withAlpha(100),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            'Pukul',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              // fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          // fontSize: 16,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${jadwal!.jamMulai} - ${jadwal!.jamSelesai}',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              // fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
