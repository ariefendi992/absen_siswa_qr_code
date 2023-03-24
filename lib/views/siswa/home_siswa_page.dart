import 'package:absen_siswa_qr_code/views/siswa/sub_menu/select_jadwal_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomeSiswaPage extends StatelessWidget {
  const HomeSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomePage Siswa',
              style: TextStyle(fontSize: 18),
            ),
            ButtonWidget(
              title: 'GO',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SelectJadwalPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
