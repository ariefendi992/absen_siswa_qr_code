import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_change_password.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_update_profil_page.dart';
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
                content: Text(
                  '${state.error}',
                  style: TextStyle(
                    color: secondary,
                  ),
                ),
                backgroundColor: errorSoft,
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: 'Dismiss',
                  disabledTextColor: Colors.white,
                  textColor: secondary,
                  onPressed: () {
                    //Do whatever you want
                  },
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
          return BlocBuilder<UserGuruCubit, UserGuruState>(
            builder: (context, state) {
              if (state is UserGuruSuccess) {
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
                            fontWeight: bold,
                            fontSize: 24,
                            color: allColor[7],
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
                              // color: allColor[7],
                              gradient: LinearGradient(
                                colors: [
                                  // kPrimaryColor,
                                  // primary,
                                  allColor[7],
                                  allColor[4],
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),

                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.userGuru.firstName} ${state.userGuru.lastName}',
                                  style: TextStyle(
                                      fontWeight: bold,
                                      fontSize: 24,
                                      color: kWhiteColor),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Guru MataPelajaran :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kWhiteColor.withAlpha(200),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${state.userGuru.mapel}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kWhiteColor.withAlpha(200),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
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
                          children: [
                            CardWithBorDerWidget(
                              title: 'Perbaharui Profil',
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return GuruUpdateProfilePage(
                                      userGuru: state.userGuru,
                                    );
                                  },
                                ));
                              },
                            ),
                            CardWithBorDerWidget(
                              topBorder: BorderSide.none,
                              leftIcon: Icons.lock_reset_rounded,
                              title: 'Ganti Kata Sandi',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GuruChangePassPage(),
                                  ),
                                );
                              },
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
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
