import 'dart:async';

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

  @override
  void initState() {
    super.initState();
    // defaultToken();
    Timer(Duration(seconds: 3), () {
      autoSkipLogin();
    });
  }

  // void defaultToken() async {
  //   await CustomStorage().setStorage('token', '');
  // }

  void autoSkipLogin() async {
    // final password = await CustomStorage().getStorage('password');
    // final username = await CustomStorage().getStorage('username');
    // print('$username and $password');
    // final token = await CustomStorage().getStorage('token');
    group = await CustomStorage().getStorage('group');
    id = await CustomStorage().getStorage('id');

    if (group != null) {}

    if (group == 'siswa') {
      Navigator.pushNamedAndRemoveUntil(
          context, '/mainSiswa', (route) => false);
      // context.read<UserSiswaCubit>().getCurrentUser(id: id!);
      context.read<UserSiswaCubit>().getCurrentUser();
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
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
