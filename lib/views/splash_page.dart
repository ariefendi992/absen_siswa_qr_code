import 'dart:async';

import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late String id;
  late String group;

  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(Duration(seconds: 3), () {
        autoSkipLogin();
      });
    });
  }

  void autoSkipLogin() async {
    group = await CustomStorage().getStorage('group');

    if (group == 'siswa') {
      Navigator.pushNamedAndRemoveUntil(
          context, '/mainSiswa', (route) => false);
    } else {
      Navigator.pushNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'UPT SPF SMPN 2\nMAKASSAR',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: bold,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Versi Aplikasi 1.0.0',
                  style: TextStyle(
                    color: Colors.black.withOpacity(
                      0.7,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
