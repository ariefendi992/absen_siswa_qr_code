import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class CardJadwalHarianSiswa extends StatelessWidget {
  final JadwalPelajaranSiswaModel jadwal;
  const CardJadwalHarianSiswa(this.jadwal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6, left: 6, right: 6),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${jadwal.mapel}',
                style: TextStyle(
                  color: allColor[7],
                  fontWeight: bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              IntrinsicHeight(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${jadwal.mulai}',
                          style: TextStyle(
                            color: successPrimary,
                            fontSize: 16,
                            fontWeight: bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          'MULAI',
                          style: TextStyle(
                              color: allColor[7],
                              fontWeight: medium,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: allColor[7],
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${jadwal.selesai}',
                          style: TextStyle(
                            color: c1,
                            fontSize: 16,
                            fontWeight: bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          'SELESAI',
                          style: TextStyle(
                            color: allColor[7],
                            fontWeight: medium,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),
              Text(
                '${jadwal.guru}',
                style: TextStyle(
                    fontSize: 16,
                    color: allColor[7],
                    fontWeight: bold,
                    letterSpacing: 0.3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
