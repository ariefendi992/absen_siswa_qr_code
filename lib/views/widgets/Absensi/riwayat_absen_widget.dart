import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class RiwayatAbsenWidget extends StatelessWidget {
  final String tgl;
  final List<RAbsensiModel> riwayatAbsensi;
  const RiwayatAbsenWidget(this.tgl, this.riwayatAbsensi, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget detailData(RAbsensiModel riwayat) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: secondarySoft, width: 0.8),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: primarySoft,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  color: kWhiteColor,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: TextStyle(
                      color: secondary,
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Kelas',
                    style: TextStyle(
                      color: secondary,
                      fontSize: 16,
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
                Text(
                  ':',
                  style: TextStyle(
                    fontWeight: medium,
                  ),
                ),
              ],
            )),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${riwayat.namaSiswa}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    '${riwayat.kelas}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Material(
      color: secondaryExtraSoft,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 24, top: 12),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$tgl',
              style: TextStyle(
                fontSize: 18,
                fontWeight: medium,
                color: allColor[7],
              ),
            ),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: riwayatAbsensi.map((e) => detailData(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
