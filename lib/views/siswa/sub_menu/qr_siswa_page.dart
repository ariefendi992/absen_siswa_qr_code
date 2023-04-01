import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class QrSiswaPage extends StatelessWidget {
  const QrSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgorundScaffold,
      appBar: AppBar(
        foregroundColor: kBlackColor,
        backgroundColor: kBackgorundScaffold,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'QR Code',
          style: TextStyle(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'QR CODE',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
