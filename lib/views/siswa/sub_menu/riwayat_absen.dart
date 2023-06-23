import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/widget_riwayat_absen.dart';
import 'package:flutter/material.dart';

class SiswaRiwayatAbsensiPage extends StatelessWidget {
  const SiswaRiwayatAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0.2,
          title: Text(
            'Riwayat Absen',
            style: TextStyle(
              color: allColor[7],
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: allColor[7],
                ),
              );
            },
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bahasa Indonesia',
                  style: TextStyle(
                    fontWeight: medium,
                    color: allColor[7],
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 2),
                WidgetRiwayatAbsenSiswaCard(),
                WidgetRiwayatAbsenSiswaCard(),
                WidgetRiwayatAbsenSiswaCard(),
                WidgetRiwayatAbsenSiswaCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
