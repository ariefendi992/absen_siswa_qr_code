import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_keterangan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

class GuruHomePage extends StatelessWidget {
  const GuruHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// * START --> SUCCESS STATE
    Widget successState(state) {
      return ListView(
        shrinkWrap: true,
        // physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        children: [
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                // ClipOval(
                //   child: Container(
                //     width: 42,
                //     height: 42,
                //     child: Container(
                //       color: primary,
                //       child: Center(
                //         child: Text(
                //           '${state.userGuru.firstName}',
                //           style: TextStyle(
                //               color: kWhiteColor,
                //               fontSize: 20,
                //               fontWeight: medium),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'selamat datang',
                      style: TextStyle(
                        fontSize: 14,
                        color: secondarySoft,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${state.userGuru.firstName} ${state.userGuru.lastName}',
                      style: TextStyle(
                        fontWeight: medium,
                        fontSize: 17,
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage('assets/images/pattern-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guru Mata Pelajaran',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${state.userGuru.nip}',
                  style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: bold,
                    letterSpacing: 1.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    color: primarySoft,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '${state.userGuru.mapel}',
                              style: TextStyle(
                                fontSize: 16,
                                color: kWhiteColor,
                                fontWeight: medium,
                                letterSpacing: 1,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18),
            width: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilihan',
                  style: TextStyle(
                    fontSize: 16,
                    color: secondary,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                      color: secondaryExtraSoft.withAlpha(100),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: secondaryExtraSoft.withAlpha(120),
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonMenuKeterangan(
                          icons: Icons.calendar_month_rounded,
                          iconColors: errorSoft,
                          height: 56,
                          width: 56,
                          iconSize: 32,
                          title: 'JadwalMengajar',
                        ),
                        ButtonMenuKeterangan(
                          icons: Icons.people_alt_rounded,
                          iconColors: allColor[1],
                          height: 56,
                          width: 56,
                          iconSize: 32,
                          title: 'DaftarKelas',
                        ),
                        ButtonMenuKeterangan(
                          icons: Icons.history_edu_rounded,
                          iconColors: allColor[4],
                          height: 56,
                          width: 56,
                          iconSize: 32,
                          title: 'RiwayatAbsen',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal hari ini',
                  style: TextStyle(
                    fontSize: 16,
                    color: secondary,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    /// * END --> SUCCESS STATE

    /// * START --> FAIL STATE
    Widget failedState(state) {
      return ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Center(
              child: Text(
                state.error,
                style: TextStyle(
                  fontWeight: medium,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      extendBody: true,
      body: BlocBuilder<UserGuruCubit, UserGuruState>(
        builder: (context, state) {
          /// * SUCCESS STATE
          if (state is UserGuruSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserGuruCubit>().currenUserGuru();
              },
              child: successState(state),
            );
          }

          /// * FAILED STATE
          else if (state is UserGuruFailed) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserGuruCubit>().currenUserGuru();
              },
              child: failedState(state),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
