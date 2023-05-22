import 'dart:async';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
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

  @override
  void initState() {
    super.initState();
    // defaultToken();
    autoLogout();
    Timer(Duration(seconds: 3), () {
      autoSkipLogin();
    });
  }

  void autoSkipLogin() async {
    final token = await storage.getStorage('access_token');
    group = await storage.getStorage('group');
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
      Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
    }
  }

  void autoLogout() async {
    refTokenExp = await storage.getStorage('refTokenExp');

    if (refTokenExp != null && refTokenExp!.toString().isNotEmpty) {
      stringToDateTime = DateTime.tryParse(refTokenExp!);
      if (now.isAfter(stringToDateTime!.toUtc())) {
        setState(() {
          storage.deleteKey('id');
          storage.deleteKey('access_token');
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
