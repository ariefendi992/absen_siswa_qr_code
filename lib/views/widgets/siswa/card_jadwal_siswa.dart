import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetJadwalMapelSiswa extends StatelessWidget {
  final String hari;
  final List<JadwalPelajaranSiswaModel> jadwal;
  const WidgetJadwalMapelSiswa(this.hari, this.jadwal, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget detailData(JadwalPelajaranSiswaModel jadwal) {
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: secondary.withOpacity(0.25),
              width: 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${jadwal.mapel}',
              style: TextStyle(
                  color: allColor[7], fontWeight: medium, fontSize: 20),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Nama Guru',
                  style: TextStyle(fontWeight: medium, color: allColor[7]),
                ),
                Spacer(),
                Text(
                  '${jadwal.guru}',
                  style: TextStyle(fontWeight: medium, color: allColor[7]),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Text(
                  'Pukul',
                  style: TextStyle(fontWeight: medium, color: allColor[7]),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  '${jadwal.mulai}',
                  style: TextStyle(fontWeight: medium, color: successPrimary),
                ),
                Text(
                  ' - ',
                  style: TextStyle(fontWeight: medium, color: allColor[7]),
                ),
                Text(
                  '${jadwal.selesai}',
                  style: TextStyle(fontWeight: medium, color: c1),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Text(
            //       'Jam-Ke',
            //       style: TextStyle(fontWeight: medium, color: allColor[7]),
            //     ),
            //     Spacer(),
            //     Text(
            //       '${jadwal.jamKe}',
            //       style: TextStyle(fontWeight: medium, color: allColor[7]),
            //     ),
            //   ],
            // ),
          ],
        ),
      );
    }

    return Material(
      color: secondaryExtraSoft,
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 18,
          top: 12,
        ),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hari : $hari',
              style: TextStyle(
                fontSize: 18,
                color: secondaryPrimary,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 4),
            Column(
              children: jadwal.map((e) => detailData(e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
