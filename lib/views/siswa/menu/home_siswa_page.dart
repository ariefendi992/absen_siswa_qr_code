import 'package:absen_siswa_qr_code/cubit/master/pelanggaran/data_pelanggaran_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/jadwal_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/mapel_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_keterangan.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/card_pelanggar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSiswaPage extends StatelessWidget {
  const HomeSiswaPage({super.key});

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
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
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
                                        fontSize: 17,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      '${user.nisn}',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 18,
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
                                        fontSize: 17,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      '${user.waliKelas}',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 18,
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
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(color: kWhiteColor),
                                child: ClipOval(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: primarySoft),
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
    Widget content(String kelasId) {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 18,
                color: allColor[7],
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
                        fontColor: allColor[7],
                        fontSize: 12,
                      ),
                      ButtonMenuKeterangan(
                        icons: Icons.people_alt_rounded,
                        iconColors: allColor[1],
                        height: 48,
                        width: 48,
                        iconSize: 32,
                        title: 'DaftarKelas',
                        fontColor: allColor[7],
                        fontSize: 12,
                      ),
                      ButtonMenuKeterangan(
                        icons: Icons.history_edu_rounded,
                        iconColors: allColor[4],
                        height: 48,
                        width: 48,
                        iconSize: 32,
                        title: 'RiwayatAbsen',
                        fontColor: allColor[7],
                        fontSize: 12,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

      // return Container(
      //   margin: EdgeInsets.only(top: 15),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // GridView.count(
      //       //   crossAxisCount: 3,
      //       //   physics: NeverScrollableScrollPhysics(),
      //       //   shrinkWrap: true,
      //       //   childAspectRatio: 1.2,
      //       //   children: [
      //       //     InkWell(
      //       //       borderRadius: BorderRadius.circular(28),
      //       //       onTap: () {
      //       //         Navigator.push(
      //       //           context,
      //       //           MaterialPageRoute(
      //       //               builder: (context) => MapelPage(kelasId)),
      //       //         );
      //       //       },
      //       //       child: Column(
      //       //         mainAxisAlignment: MainAxisAlignment.center,
      //       //         crossAxisAlignment: CrossAxisAlignment.center,
      //       //         children: [
      //       //           Container(
      //       //             height: 55,
      //       //             width: 55,
      //       //             decoration: BoxDecoration(
      //       //               color: allColor[4],
      //       //               shape: BoxShape.circle,
      //       //             ),
      //       //             child: Center(
      //       //               child: Icon(
      //       //                 Icons.menu_book,
      //       //                 color: kWhiteColor,
      //       //                 size: 28,
      //       //               ),
      //       //             ),
      //       //           ),
      //       //           SizedBox(height: 10),
      //       //           Text(
      //       //             'MataPelajaran',
      //       //             style: TextStyle(
      //       //               fontSize: 14,
      //       //               fontWeight: medium,
      //       //               color: Colors.black.withOpacity(0.6),
      //       //             ),
      //       //           )
      //       //         ],
      //       //       ),
      //       //     ),
      //       //     InkWell(
      //       //       borderRadius: BorderRadius.circular(28),
      //       //       onTap: () {},
      //       //       child: Column(
      //       //         mainAxisAlignment: MainAxisAlignment.center,
      //       //         crossAxisAlignment: CrossAxisAlignment.center,
      //       //         children: [
      //       //           Container(
      //       //             height: 55,
      //       //             width: 55,
      //       //             decoration: BoxDecoration(
      //       //               color: allColor[6],
      //       //               shape: BoxShape.circle,
      //       //             ),
      //       //             child: Center(
      //       //               child: Icon(
      //       //                 Icons.list,
      //       //                 color: kWhiteColor,
      //       //                 size: 28,
      //       //               ),
      //       //             ),
      //       //           ),
      //       //           SizedBox(height: 10),
      //       //           Text(
      //       //             'Absensi',
      //       //             style: TextStyle(
      //       //               fontSize: 14,
      //       //               fontWeight: medium,
      //       //               color: Colors.black.withOpacity(0.6),
      //       //             ),
      //       //           )
      //       //         ],
      //       //       ),
      //       //     ),
      //       //     InkWell(
      //       //       borderRadius: BorderRadius.circular(28),
      //       //       onTap: () {
      //       //         // Navigator.pushReplacement(context,
      //       //         //     MaterialPageRoute(builder: (context) {
      //       //         //   return JadwalPageSiswa();
      //       //         // }));
      //       //         Navigator.push(
      //       //           context,
      //       //           MaterialPageRoute(
      //       //             builder: (context) {
      //       //               return JadwalPageSiswa();
      //       //             },
      //       //           ),
      //       //         );
      //       //       },
      //       //       child: Column(
      //       //         mainAxisAlignment: MainAxisAlignment.center,
      //       //         crossAxisAlignment: CrossAxisAlignment.center,
      //       //         children: [
      //       //           Container(
      //       //             height: 55,
      //       //             width: 55,
      //       //             decoration: BoxDecoration(
      //       //               color: catColors[2],
      //       //               shape: BoxShape.circle,
      //       //             ),
      //       //             child: Center(
      //       //               child: Icon(
      //       //                 Icons.more_time,
      //       //                 color: kWhiteColor,
      //       //                 size: 28,
      //       //               ),
      //       //             ),
      //       //           ),
      //       //           SizedBox(height: 10),
      //       //           Text(
      //       //             'Jadwal',
      //       //             style: TextStyle(
      //       //               fontSize: 14,
      //       //               fontWeight: medium,
      //       //               color: Colors.black.withOpacity(0.6),
      //       //             ),
      //       //           )
      //       //         ],
      //       //       ),
      //       //     ),
      //       //   ],
      //       // ),
      //     ],
      //   ),
      // );
    }

    // * CONTENT JADWAL HARI INI:
    Widget jadwalHarian() {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jadwal Hari Ini',
              style: TextStyle(
                fontSize: 18,
                color: allColor[7],
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Material(
                    elevation: 1.5,
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pendidikan Jasmani. Olahraga dan Kesehatan',
                            style: TextStyle(
                              color: allColor[7],
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '07.00',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontSize: 18,
                                          fontWeight: bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Text(
                                        'Mulai',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontWeight: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  color: allColor[7],
                                  thickness: 2,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '07.00',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontSize: 18,
                                          fontWeight: bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Text(
                                        'Selesai',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontWeight: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Dra. Haslinda',
                            style: TextStyle(
                                fontSize: 16,
                                color: allColor[7],
                                fontWeight: bold,
                                letterSpacing: 0.3),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Material(
                    elevation: 1.5,
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pendidikan Jasmani. Olahraga dan Kesehatan',
                            style: TextStyle(
                              color: allColor[7],
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '07.00',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontSize: 18,
                                          fontWeight: bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Text(
                                        'Mulai',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontWeight: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  color: allColor[7],
                                  thickness: 2,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '07.00',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontSize: 18,
                                          fontWeight: bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Text(
                                        'Selesai',
                                        style: TextStyle(
                                          color: allColor[7],
                                          fontWeight: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Dra. Haslinda',
                            style: TextStyle(
                                fontSize: 16,
                                color: allColor[7],
                                fontWeight: bold,
                                letterSpacing: 0.3),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    // *NOTE : CONTENT PELANGGARAN
    Widget daftarPelanggar() {
      return Container(
        margin: EdgeInsets.only(bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Siswa Melanggar',
              style: TextStyle(
                fontSize: 18,
                color: allColor[7],
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 16),
            BlocBuilder<DataPelanggaranCubit, DataPelanggaranState>(
              builder: (context, state) {
                if (state is DataPelanggaranSuccess) {
                  final pelanggar = state.dataPelanggaran;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: pelanggar.map((DaftarPelanggarModel pelanggar) {
                        return CardPelanggaranWidget(pelanggar: pelanggar);
                      }).toList(),
                    ),
                  );
                } else if (state is DataPelanggaranFailure) {
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18),
                        child: Text(
                          state.error,
                          style: TextStyle(
                            color: allColor[7],
                            fontWeight: medium,
                          ),
                        ),
                      )
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 18),
                      child: Text(
                        'Sementara memproses data...',
                        style: TextStyle(
                          color: allColor[7],
                          fontWeight: medium,
                        ),
                      ),
                    )
                  ],
                );
                ;
              },
            )
          ],
        ),
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
                  content(user.kelasId.toString()),
                  daftarPelanggar(),
                  jadwalHarian(),
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
