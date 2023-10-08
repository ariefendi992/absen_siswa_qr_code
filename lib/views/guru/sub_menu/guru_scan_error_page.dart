import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class GuruScanErrorPage extends StatelessWidget {
  final Function() closeCamera;
  final String error;
  const GuruScanErrorPage({
    super.key,
    required this.closeCamera,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: kBackgorundScaffold,
          foregroundColor: secondary,
          elevation: 0.3,
          title: Text(
            'Hasil Pindai QR',
            style: TextStyle(
              letterSpacing: 0.5,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                closeCamera();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            );
          }),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: 80, top: MediaQuery.of(context).size.height / 6),
            width: double.infinity,
            child: Container(
              alignment: Alignment.center,
              width: 48,
              height: 48,
              child: Icon(
                Icons.qr_code_scanner,
                size: 100,
                color: kGreyColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Kode QR tidak sah',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  '${error}',
                  style: TextStyle(
                    color: kGreyColor,
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 18),
                ButtonWidget(
                  title: 'Pindai Ulang',
                  onTap: () {
                    closeCamera();
                    Navigator.pop(context);
                  },
                  height: 44,
                  width: MediaQuery.of(context).size.width / 1.5,
                  colors: primary,
                  fontSize: 20,
                  borderRadiusCircular: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
