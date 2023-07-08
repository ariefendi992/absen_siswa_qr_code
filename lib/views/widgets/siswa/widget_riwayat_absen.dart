import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetRiwayatAbsenSiswaCard extends StatelessWidget {
  final String mapel;
  final List<RiwayatAbsenSiswaModel> riwayatAbsen;
  const WidgetRiwayatAbsenSiswaCard(this.mapel, this.riwayatAbsen, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget detailData(RiwayatAbsenSiswaModel riwayatAbsen) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Material(
          elevation: 0,
          borderRadius: BorderRadius.circular(8),
          color: primaryBgCard,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
                color: primaryBgCard, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Pertemuan',
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
                      flex: 2,
                      child: Text(
                        '${riwayatAbsen.urutan}',
                        style: TextStyle(
                          color: allColor[7],
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Tgl Absen',
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
                      flex: 2,
                      child: Text(
                        '${riwayatAbsen.tglAbsen}',
                        style: TextStyle(
                          color: allColor[7],
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Keterangan',
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
                      flex: 2,
                      child: Text(
                        '${riwayatAbsen.ket}',
                        style: TextStyle(
                          color: allColor[7],
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$mapel',
          style: TextStyle(
            fontWeight: medium,
            color: allColor[7],
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Column(
          children: riwayatAbsen.map((e) => detailData(e)).toList(),
        ),
      ],
    );
  }
}
