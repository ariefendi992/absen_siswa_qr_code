import 'package:absen_siswa_qr_code/cubit/master/jadwal/jadwal_siswa/jadwal_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/pelanggaran/data_pelanggaran_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/jadwal_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/riwayat_absen.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/siswa_riwayat_pelanggara,.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/button_menu_category_siswa.dart';
// import 'package:absen_siswa_qr_code/views/widgets/siswa/card_jadwal_harian_siswa.dart';
// import 'package:absen_siswa_qr_code/views/widgets/siswa/card_pelanggar_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/widget_jadwal_harian_siswa2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSiswaPage extends StatefulWidget {
  const HomeSiswaPage({super.key});

  @override
  State<HomeSiswaPage> createState() => _HomeSiswaPageState();
}

class _HomeSiswaPageState extends State<HomeSiswaPage> {
  @override
  void initState() {
    // context.read<JadwalSiswaCubit>().fetchJadwalHarianSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // NOTE : HEADER
    Widget header(UserSiswaModel user) {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hai, ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: medium,
                    wordSpacing: 1,
                    color: allColor[7],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      user.firstName.toString().length < 3
                          ? user.lastName.toString().split(' ').length > 1
                              ? user.lastName.toString().split(' ')[0] +
                                  ' ' +
                                  user.lastName.toString().split(' ')[1]
                              : user.lastName.toString()
                          : user.firstName.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: semiBold,
                        wordSpacing: 1,
                        letterSpacing: 0.5,
                        color: allColor[7],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 4),
            Text(
              'Selamat Datang!',
              style: TextStyle(color: allColor[7], fontSize: 14),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 18),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: allColor[2],
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage('assets/images/pattern-1.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${user.additionalData!["hari"]}',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'SISWA',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '-',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '${user.kelas}',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      'NISN : ',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 14,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      '${user.nisn}',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      'Wali Kelas : ',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 14,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      '${user.waliKelas}',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            child: ClipOval(
                              child: Container(
                                height: 55,
                                width: 55,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(color: kWhiteColor),
                                child: ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade400),
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: kWhiteColor,
                                      size: 44,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
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

    // *NOTE: MENU CONTENT
    Widget content() {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori Menu',
              style: TextStyle(
                fontSize: 16,
                color: allColor[7],
                fontWeight: medium,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonCardMenuKategori(
                    title: Text(
                      'JadwalMapel',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                    faIcon: FontAwesomeIcons.calendarWeek,
                    bgCard: greenBgCardSoft,
                    bgIconColor: greenBgCardPrimary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JadwalPageSiswa(),
                        ),
                      );
                      context.read<JadwalSiswaCubit>().fetchJadwalPelajara();
                    },
                  ),
                  ButtonCardMenuKategori(
                    title: Text(
                      'Pelanggaran',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                    faIcon: FontAwesomeIcons.userXmark,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SiswaRiwayatPelanggaranPage();
                      }));
                    },
                  ),
                  ButtonCardMenuKategori(
                    title: Text(
                      'RiwayatAbsen',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                    faIcon: FontAwesomeIcons.clockRotateLeft,
                    bgCard: redBgCardSoft,
                    bgIconColor: redBgCardPrimary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SiswaRiwayatAbsensiPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // * CONTENT JADWAL HARI INI:
    // Widget jadwalHarian() {
    //   return Container(
    //     margin: EdgeInsets.only(bottom: 24),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Jadwal Hari Ini',
    //           style: TextStyle(
    //             fontSize: 16,
    //             color: allColor[7],
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(height: 16),
    //         BlocBuilder<JadwalSiswaCubit, JadwalSiswaState>(
    //           builder: (context, state) {
    //             if (state is JadwalHarianSiswaSuccess) {
    //               final jadwal = state.jadwal;
    //               return SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //                 child: Row(
    //                   children: jadwal.map((JadwalPelajaranSiswaModel jadwal) {
    //                     return CardJadwalHarianSiswa(jadwal);
    //                   }).toList(),
    //                 ),
    //               );
    //             } else if (state is JadwalHarianFailure) {
    //               return Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   SizedBox(height: 40),
    //                   Center(
    //                     child: Text(
    //                       '${state.error}',
    //                       style: TextStyle(
    //                         color: allColor[7],
    //                         fontWeight: medium,
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               );
    //             }
    //             return Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 SizedBox(height: 40),
    //                 Center(
    //                   child: Text(
    //                     'Sedang memproses data...',
    //                     style: TextStyle(
    //                       color: allColor[7],
    //                       fontWeight: medium,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // *NOTE : CONTENT PELANGGARAN
    // Widget daftarPelanggar() {
    //   return Container(
    //     margin: EdgeInsets.only(bottom: 6),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       // mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Text(
    //           'Data Pelanggar',
    //           style: TextStyle(
    //             fontSize: 16,
    //             color: allColor[7],
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(height: 16),
    //         BlocBuilder<DataPelanggaranCubit, DataPelanggaranState>(
    //           builder: (context, state) {
    //             if (state is DataPelanggaranSuccess) {
    //               final pelanggar = state.dataPelanggaran;
    //               return SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //                 child: Row(
    //                   children: pelanggar.map((DaftarPelanggarModel pelanggar) {
    //                     return CardPelanggaranWidget(pelanggar: pelanggar);
    //                   }).toList(),
    //                 ),
    //               );
    //             } else if (state is DataPelanggaranFailure) {
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     margin: EdgeInsets.only(bottom: 18),
    //                     child: Text(
    //                       state.error,
    //                       style: TextStyle(
    //                         color: allColor[7],
    //                         fontWeight: medium,
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               );
    //             }
    //             return Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Container(
    //                   margin: EdgeInsets.only(bottom: 18),
    //                   child: Text(
    //                     'Sementara memproses data...',
    //                     style: TextStyle(
    //                       color: allColor[7],
    //                       fontWeight: medium,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget jadwalHarian2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jadwal Hari Ini',
            style: TextStyle(
              fontSize: 16,
              color: allColor[7],
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 16),
          BlocBuilder<JadwalSiswaCubit, JadwalSiswaState>(
            builder: (context, state) {
              if (state is JadwalHarianSiswaSuccess) {
                return Column(
                  children: state.jadwal
                      .map(
                        (JadwalPelajaranSiswaModel jadwal) =>
                            WidgetJadwalHarian2(jadwal),
                      )
                      .toList(),
                );
              } else if (state is JadwalHarianFailure) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40),
                    Center(
                      child: Text(
                        '${state.error}',
                        style: TextStyle(
                          color: allColor[7],
                          fontWeight: medium,
                        ),
                      ),
                    )
                  ],
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'Sedang memproses data...',
                      style: TextStyle(
                        color: allColor[7],
                        fontWeight: medium,
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      );
    }

    return BlocBuilder<UserSiswaCubit, UserSiswaState>(
      builder: (context, state) {
        if (state is UserSiswaSuccess) {
          final user = state.userSiswa;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<UserSiswaCubit>().getCurrentUser();
            },
            color: kPrimaryColor,
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  header(user),
                  content(),
                  // daftarPelanggar(),
                  // jadwalHarian(),
                  jadwalHarian2(),
                ],
              ),
            ),
          );
        } else if (state is UserSiswaFailed) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<UserSiswaCubit>().getCurrentUser();
              context.read<DataPelanggaranCubit>().fetchDataPelanggaran();
            },
            child: ListView(
              shrinkWrap: true,
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
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
