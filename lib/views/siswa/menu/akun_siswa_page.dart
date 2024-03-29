import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/id_card_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/siswa_profil_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/siswa_update_password.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_with_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AkunSiswaPage extends StatefulWidget {
  const AkunSiswaPage({super.key});

  @override
  State<AkunSiswaPage> createState() => _AkunSiswaPageState();
}

class _AkunSiswaPageState extends State<AkunSiswaPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserSiswaCubit>().getCurrentUser();
  }

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
          }
        },
        builder: (context, state) {
          return BlocBuilder<UserSiswaCubit, UserSiswaState>(
            builder: (context, state) {
              if (state is UserSiswaSuccess) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 20),
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
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: <Widget>[
                            CardWithBorDerWidget(
                              title: 'Perbaharui Data',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return SiswaProfilPage(
                                      siswa: state.userSiswa,
                                    );
                                  }),
                                );
                              },
                            ),
                            CardWithBorDerWidget(
                              title: 'Ubah Kata Sandi',
                              topBorder: BorderSide.none,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return SiswaUpdatePassPage();
                                })));
                              },
                            ),
                            CardWithBorDerWidget(
                              title: 'Kartu Pelajar',
                              topBorder: BorderSide.none,
                              leftIcon: Icons.card_membership,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return IDCardPage();
                                    },
                                  ),
                                );
                              },
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
