import 'dart:async';

import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_with_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilSiswaPage extends StatelessWidget {
  const ProfilSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           'Profil Page',
    //           style: TextStyle(fontSize: 32),
    //         ),
    //         BlocConsumer<AuthCubit, AuthState>(
    //           listener: (context, state) {
    //             if (state is AuthFailed) {
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 SnackBar(
    //                   backgroundColor: kErrorColor,
    //                   content: Text(
    //                     state.error,
    //                     style: TextStyle(
    //                       fontWeight: medium,
    //                       fontSize: 14,
    //                     ),
    //                   ),
    //                 ),
    //               );
    //             } else if (state is AuthInitial) {
    //               context.read<PageCubit>().setPage(0);
    //               Navigator.pushNamedAndRemoveUntil(
    //                   context, '/auth', (route) => false);
    //             }
    //           },
    //           builder: (context, state) {
    //             return ButtonWidget(
    //               title: 'Keluar',
    //               onTap: () {
    //                 context.read<AuthCubit>().logOut();
    //               },
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${state.error}',
                  style: TextStyle(color: secondary),
                ),
                backgroundColor: errorSoft,
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: 'Dismiss',
                  disabledTextColor: Colors.white,
                  textColor: secondary,
                  onPressed: () {},
                ),
              ),
            );
          } else if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/auth', (route) => false);
            Timer(Duration(seconds: 2), () {
              context.read<PageCubit>().setPage(0);
            });
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Pengaturan Akun',
                    style: TextStyle(
                      fontSize: 24,
                      color: allColor[7],
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 40),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            allColor[2],
                            allColor[14],
                            allColor[7].withAlpha(185),
                            // allColor[4]
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: <Widget>[
                      CardWithBorDerWidget(title: 'Perbaharui Profil'),
                      CardWithBorDerWidget(
                        title: 'Ganti Kata Sandi',
                        topBorder: BorderSide.none,
                      ),
                      CardWithBorDerWidget(
                        title: 'Keluar',
                        titleColor: errorSoft,
                        colorIcon: errorSoft,
                        topBorder: BorderSide.none,
                        leftIcon: Icons.logout_rounded,
                        onTap: () {
                          context.read<AuthCubit>().logOut();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
