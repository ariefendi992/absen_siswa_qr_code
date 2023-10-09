import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetCardRiwayatAbsenMapel extends StatelessWidget {
  final RiwayatAbsenSiswaMapelModel riwayatMapel;
  const WidgetCardRiwayatAbsenMapel(
    this.riwayatMapel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          // margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: primaryExtraSoft,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tgl Absen',
                          style: TextStyle(
                            // color: allColor[7],
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Keterangan',
                          style: TextStyle(
                            // color: allColor[7],
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Pertemuan',
                          style: TextStyle(
                            // color: allColor[7],
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          ':',
                          style: TextStyle(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ':',
                          style: TextStyle(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ':',
                          style: TextStyle(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${riwayatMapel.tglAbsen}',
                          style: TextStyle(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: riwayatMapel.ketCharacter == 'H'
                                ? successPrimary2
                                : riwayatMapel.ketCharacter == 'S'
                                    ? warning2
                                    : riwayatMapel.ketCharacter == 'I'
                                        ? allColor[6]
                                        : c1,
                          ),
                          child: Text(
                            '${riwayatMapel.keterangan}',
                            style: TextStyle(
                              fontWeight: medium,
                              color: riwayatMapel.ketCharacter == 'S'
                                  ? secondary
                                  : kWhiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ke-${riwayatMapel.pertemuan}',
                          style: TextStyle(
                            fontWeight: medium,
                          ),
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
