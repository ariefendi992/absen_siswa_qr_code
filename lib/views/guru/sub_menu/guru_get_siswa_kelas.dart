import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_daftar_kelas.dart';
import 'package:flutter/material.dart';

class GuruGetSiswaKelas extends StatelessWidget {
  const GuruGetSiswaKelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: secondary,
          elevation: 0.2,
          title: Text(
            'Daftar Mengajar',
            style: TextStyle(
              fontWeight: bold,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            },
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              'Dafar Kelas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ),
          CardDaftarKelasWidget(),
          CardDaftarKelasWidget()
        ],
      ),
    );
  }
}
