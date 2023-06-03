import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_with_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilGuruPage extends StatelessWidget {
  const ProfilGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kErrorColor,
                content: Text(
                  state.error,
                  style: TextStyle(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/auth', (route) => false);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(child: Container()),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Harnida, S.Pd.',
                      style: TextStyle(
                          fontWeight: bold, fontSize: 24, color: secondary),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Guru MataPelajaran :',
                      style: TextStyle(
                        fontSize: 16,
                        color: secondarySoft,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Pendidikan Jasmani Olahraga dan Kesehatan',
                      style: TextStyle(
                        fontSize: 16,
                        color: secondarySoft,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      CardWithBorDerWidget(
                        title: 'Perbaharui Profil',
                        onTap: () {},
                      ),
                      CardWithBorDerWidget(
                        topBorder: BorderSide.none,
                        leftIcon: Icons.lock_reset_rounded,
                        title: 'Ganti Kata Sandi',
                        onTap: () {},
                      ),
                      CardWithBorDerWidget(
                        title: 'Keluar',
                        titleColor: errorSoft,
                        topBorder: BorderSide.none,
                        colorIcon: errorSoft,
                        leftIcon: Icons.logout_rounded,
                        onTap: () {
                          context.read<AuthCubit>().logOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // ButtonWidget(
              //   title: 'Keluar',
              //   onTap: () {
              //     context.read<AuthCubit>().logOut();
              //   },
              // ),
            ],
          );
        },
      ),
    );
  }
}
