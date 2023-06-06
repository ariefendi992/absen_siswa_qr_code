import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/daftar_mapel_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_get_siswa_kelas.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_jadwal_mengajar_page.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_riwayat_absensi.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_keterangan.dart';
import 'package:absen_siswa_qr_code/views/widgets/jadwal_mapel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

class GuruHomePage extends StatefulWidget {
  const GuruHomePage({super.key});

  @override
  State<GuruHomePage> createState() => _GuruHomePageState();
}

class _GuruHomePageState extends State<GuruHomePage> {
  var count = 0;
  @override
  void initState() {
    super.initState();
    context.read<DaftarMapelCubit>().getJadwalMengajarHarian();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      // * HEADER VIEW
      Widget headerView(UserGuruModel userGuru) {
        return Container(
          margin: EdgeInsets.only(bottom: 24, top: 8),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'selamat datang',
                    style: TextStyle(
                      fontSize: 15,
                      color: secondarySoft,
                    ),
                  ),
                  Text(
                    '${userGuru.firstName} ${userGuru.lastName}',
                    style: TextStyle(
                      fontWeight: medium,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }

      //* CARD HEADER VIEW
      Widget cardHeaderView(UserGuruModel userGuru) {
        return Container(
          margin: EdgeInsets.only(bottom: 24),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(18),
            child: Container(
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
                    '${userGuru.nip}',
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
                                '${userGuru.mapel}',
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
          ),
        );
      }

      return BlocBuilder<UserGuruCubit, UserGuruState>(
        builder: (context, state) {
          if (state is UserGuruSuccess) {
            return Column(
              children: [
                headerView(state.userGuru),
                cardHeaderView(state.userGuru),
              ],
            );
          } else if (state is UserGuruFailed) {
            return Column(
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
          } else {
            return SizedBox();
          }
        },
      );
    }

    //* PILIHAN MENU VIEW
    Widget menuView() {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilihan',
              style: TextStyle(
                fontSize: 18,
                color: secondary,
                fontWeight: medium,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                    color: kBackgorundScaffold.withAlpha(20),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonMenuKeterangan(
                        icons: Icons.calendar_month_rounded,
                        iconColors: allColor.elementAt(9),
                        height: 48,
                        width: 48,
                        iconSize: 32,
                        title: 'JadwalMengajar',
                        fontSize: 12,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return GuruJadwalMengajarPage();
                          }));
                        },
                      ),
                      ButtonMenuKeterangan(
                        icons: Icons.people_alt_rounded,
                        iconColors: allColor[1],
                        height: 48,
                        width: 48,
                        iconSize: 32,
                        title: 'DaftarKelas',
                        fontSize: 12,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GuruGetSiswaKelas(),
                          ),
                        ),
                      ),
                      ButtonMenuKeterangan(
                        icons: Icons.history_edu_rounded,
                        iconColors: allColor[4],
                        height: 48,
                        width: 48,
                        iconSize: 32,
                        title: 'RiwayatAbsen',
                        fontSize: 12,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GuruRiwayatAbsensi(),
                            ),
                          );
                          context
                              .read<AbsenSiswaCubit>()
                              .getRiwayatAbsenbyTgl();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // * JADWAL MENGAJAR VIEW
    Widget jadwalView() {
      return BlocBuilder<DaftarMapelCubit, DaftarMapelState>(
        builder: (context, state) {
          if (state is DaftarMengajarHarianSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: state.jadwal!.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return JadwalMapelCard(
                      jadwal: state.jadwal![index],
                      colors: newColorList[index],
                    );
                  }),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: state.jadwal!.map((jadwal) {
              //     // count = state.jadwal!.length;

              //     if (count >= state.jadwal!.length) count = 0;
              //     // if (state.jadwal!.length >= newColorList.length) count;
              //     count++;
              //     print(count);
              //     return JadwalMapelCard(
              //       jadwal: jadwal,
              //       colors: newColorList[count],
              //       // colors: newColorList[Random().nextInt(newColorList.length)],
              //     );
              //   }).toList(),
              // ),
            );
          } else if (state is DaftarMengajarHarianFailed) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    // color: errorPrimary,
                    alignment: Alignment.center,
                    child: Text(
                      '${state.error}',
                      style: TextStyle(
                        fontSize: 16,
                        color: secondary.withOpacity(0.5),
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    // color: errorPrimary,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            );
          }
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserGuruCubit>().currenUserGuru();
        context.read<DaftarMapelCubit>().getJadwalMengajarHarian();
      },
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shrinkWrap: true,
          children: [
            header(),
            menuView(),
            Text(
              'Jadwal mengajar hari ini',
              style: TextStyle(
                fontSize: 18,
                color: secondary,
                fontWeight: medium,
              ),
            ),
            jadwalView(),
          ],
        ),
      ),
    );
  }
}
