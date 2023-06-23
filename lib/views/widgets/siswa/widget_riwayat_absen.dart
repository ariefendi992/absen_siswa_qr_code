import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class WidgetRiwayatAbsenSiswaCard extends StatelessWidget {
  const WidgetRiwayatAbsenSiswaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
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
                      'Absen-Ke',
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
                      'Absen-Ke',
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
                      'Hari, Tgl-Bulan-2022',
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
}
