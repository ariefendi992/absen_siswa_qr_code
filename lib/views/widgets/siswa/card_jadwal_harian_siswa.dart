import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class CardJadwalHarianSiswa extends StatelessWidget {
  final JadwalHarianSiswaModel jadwal;
  const CardJadwalHarianSiswa(this.jadwal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Text(
                '${jadwal.mapel}',
                style: TextStyle(
                  color: allColor[7],
                  fontWeight: bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${jadwal.mulai}',
                            style: TextStyle(
                              color: allColor[7],
                              fontSize: 18,
                              fontWeight: bold,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'Mulai',
                            style: TextStyle(
                                color: allColor[7],
                                fontWeight: medium,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: allColor[7],
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${jadwal.selesai}',
                            style: TextStyle(
                              color: allColor[7],
                              fontSize: 18,
                              fontWeight: bold,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'Selesai',
                            style: TextStyle(
                              color: allColor[7],
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
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
