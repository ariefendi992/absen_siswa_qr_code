import 'package:absen_siswa_qr_code/models/pelanggaran_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetRiwayatPelanggaran extends StatelessWidget {
  final RiwayatPelanggaranSiswaModel pelangaran;
  const WidgetRiwayatPelanggaran(this.pelangaran, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: primaryExtraSoft.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hari : ${pelangaran.tglMelanggar}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: bold,
              color: allColor[7],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: errorExtraSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    color: errorPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Keterangan',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: bold,
                          letterSpacing: 0.7),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${pelangaran.note}',
                    style: TextStyle(
                      color: errorPrimary,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
