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
          WidgetRiwayatPelanggaran(),
          WidgetRiwayatPelanggaran(),
        ],
      ),
    );
  }
}
