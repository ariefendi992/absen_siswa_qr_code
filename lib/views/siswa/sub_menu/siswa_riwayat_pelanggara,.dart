import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/wiget_riwayat_pelanggaran.dart';
import 'package:flutter/material.dart';

class SiswaRiwayatPelanggaranPage extends StatelessWidget {
  const SiswaRiwayatPelanggaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: allColor[7],
          elevation: 0.2,
          title: Text(
            'RiwayatPelanggaran',
            style: TextStyle(
              color: allColor[7],
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: ((context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            }),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                      color: errorExtraSoft,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 32,
                        color: allColor[9],
                      ),
                    ),
                  ),
                  Text(
                    'Dibina',
                    style: TextStyle(
                      fontSize: 14,
                      color: allColor[7],
                      fontWeight: medium,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                      color: allColor[4],
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 32,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Text(
                    'Evaluasi',
                    style: TextStyle(
                      fontSize: 14,
                      color: allColor[7],
                      fontWeight: medium,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(
            color: secondaryExtraSoft,
            height: 4,
            thickness: 1.6,
            indent: 4,
            endIndent: 4,
          ),
          SizedBox(height: 16),
          WidgetRiwayatPelanggaran(),
          WidgetRiwayatPelanggaran(),
        ],
      ),
    );
  }
}
