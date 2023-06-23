import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetRiwayatPelanggaran extends StatelessWidget {
  const WidgetRiwayatPelanggaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: primaryExtraSoft, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hari : Senin, 14-Juni-2023',
            style: TextStyle(
              fontSize: 16,
              fontWeight: bold,
              color: allColor[7],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Nama',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ':',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  'Ari Efendi Like Coding Tech',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'NISN',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ':',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  '1234567890',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 2,
          //       child: Text(
          //         'Pelanggaran',
          //         style: TextStyle(
          //           fontWeight: medium,
          //           color: allColor[7],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Text(
          //         ':',
          //         style: TextStyle(
          //           fontWeight: medium,
          //           color: allColor[7],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 4,
          //       child: Text(
          //         'Tidak mengikuti upacara',
          //         style: TextStyle(
          //           fontWeight: medium,
          //           color: c1,
          //         ),
          //         textAlign: TextAlign.right,
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                color: primaryColor2, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                'Terlambat dalam mengadiri upacara bendera pada hari senin',
                style: TextStyle(
                  color: secondary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
