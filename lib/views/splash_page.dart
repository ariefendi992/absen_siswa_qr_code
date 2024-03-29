import 'dart:async';
import 'dart:io';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:absen_siswa_qr_code/views/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? id;
  String? group;
  String? accessToken;
  String? refTokenExp;
  DateTime? stringToDateTime;
  final DateTime now = DateTime.now();
  final storage = CustomStorage();
  String body = '';
  bool? koneksi;

  @override
  void initState() {
    super.initState();
    autoLogout();
    checkConnection();

    Timer(Duration(seconds: 3), () {
      autoSkipLogin();
    });
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup(url_);

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // print('Konseksi ---> Baik');
      }
    } on SocketException {
      // print('Tidak ada koneksi');
      setState(() {
        storage.deleteKey('access_token');
        storage.deleteKey('token');
        koneksi = false;
      });
    }
  }

  void autoSkipLogin() async {
    final token = await storage.getStorage('access_token');
    // final refreshToken = await storage.getStorage('refreshToken');

    // print(refreshToken);

    group = await storage.getStorage('group');
    // print(token);
    id = await storage.getStorage('id');
    if (token != null && token.toString().isNotEmpty) {
      if (group == 'siswa') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/mainSiswa', (route) => false);
        context.read<UserSiswaCubit>().getCurrentUser();
      } else if (group == 'guru') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/mainGuru', (route) => false);
        context.read<UserGuruCubit>().currenUserGuru();
      }
    } else {
      // Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return AuthPage(
          koneksi: koneksi,
        );
      }), (route) => false);
    }
  }

  void autoLogout() async {
    refTokenExp = await storage.getStorage('refTokenExp');
    final String? errorMsg = await storage.getStorage('errorMsg');
    // print(errorMsg);

    // print(refTokenExp);
    if (refTokenExp != null && refTokenExp!.toString().isNotEmpty) {
      stringToDateTime = DateTime.tryParse(refTokenExp!);
      if (now.isAfter(stringToDateTime!.toUtc()) &&
          errorMsg == 'token has expired') {
        setState(() {
          storage.deleteKey('id');
          storage.deleteKey('token');
          storage.deleteKey('refresh_token');
          context.read<PageCubit>().setPage(0);
        });
      }
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
                  width: 180,
                  height: 180,
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
                // Text(
                //   'Versi Aplikasi 1.0.0',
                //   style: TextStyle(
                //     color: Colors.black.withOpacity(
                //       0.7,
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
