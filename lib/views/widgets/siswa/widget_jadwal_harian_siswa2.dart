import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetJadwalHarian2 extends StatelessWidget {
  final JadwalPelajaranSiswaModel jadwal;
  const WidgetJadwalHarian2(this.jadwal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Material(
        elevation: 2.5,
        borderRadius: BorderRadius.circular(18),
        color: primaryBgCard,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          decoration: BoxDecoration(
              color: primaryBgCard, borderRadius: BorderRadius.circular(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${jadwal.mapel}',
                style: TextStyle(
                  color: allColor[7],
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Nama Guru',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ':',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${jadwal.guru}',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Pukul',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ':',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${jadwal.mulai}',
                          style: TextStyle(
                            color: successPrimary,
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          ' - ',
                          style: TextStyle(
                            color: allColor[7],
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '${jadwal.selesai}',
                          style: TextStyle(
                            color: c1,
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
