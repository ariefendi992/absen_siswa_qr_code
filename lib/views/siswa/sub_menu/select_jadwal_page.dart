import 'package:absen_siswa_qr_code/views/siswa/main_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class SelectJadwalPage extends StatelessWidget {
  const SelectJadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Jadwal Page',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          ButtonWidget(
            title: 'back',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainSiswaPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
