import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/scan_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:absen_siswa_qr_code/views/widgets/Absensi/widget_riwayat_absen_mapel.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_keterangan.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuruResultScanPage extends StatefulWidget {
  final String username;
  final Function() closeCameraScreen;

  const GuruResultScanPage({
    required this.username,
    required this.closeCameraScreen,
    super.key,
  });

  @override
  State<GuruResultScanPage> createState() => _GuruResultScanPageState();
}

class _GuruResultScanPageState extends State<GuruResultScanPage> {
  CustomStorage storage = CustomStorage();
  bool shouldPop = true;
  String ket = '';
  bool showSnackBar = true;

  @override
  void initState() {
    super.initState();
    context.read<ScanSiswaCubit>().getSiswaByUsername(
          username: widget.username,
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget cardRiwayatAbsen(ScanSiswaModel siswaData) {
      print('DATA ==> ${siswaData}');
      return Column(
        children: siswaData.dataRiwayat!.data
            .map((e) => WidgetCardRiwayatAbsenMapel(e))
            .toList(),
      );
    }

    /// * START WIDGET CARD
    Widget cardWidget(ScanSiswaModel siswaData) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: primary,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern-2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 6),
              alignment: Alignment.topRight,
              child: Text(
                '${siswaData.additionalData!['data']['today']}',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: medium,
                  letterSpacing: 1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Siswa',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      '${widget.username}',
                      style: TextStyle(
                        color: kWhiteColor.withOpacity(0.8),
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 64,
                  height: 64,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(50)),
                  child: siswaData.data!.picture != null
                      ? ClipOval(
                          child: Image.network(
                            "${baseUrl}/${siswaData.data!.picture}",
                            fit: BoxFit.cover,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/images/UserCircle.svg',
                          fit: BoxFit.cover,
                          color: kWhiteColor,
                        ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: primarySoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Kelas',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Semester',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Pertemuan',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Status',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            ':',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            ':',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            ':',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            ':',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            ':',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: siswaData.data!.lastName!.length >= 15 ? 3 : 2,
                        child: Container(
                          // color: errorSoft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                // 'A. Zhil Zhillah Anugrah Tandiari',
                                '${siswaData.data?.firstName} ${siswaData.data?.lastName}',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: 6),
                              Text(
                                '${siswaData.data!.kelas}',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '${siswaData.data!.semester}',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Ke-${siswaData.data!.additionalData!["count_pertemuan"]}',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 6),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: allColor[8],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '${siswaData.data!.additionalData!["status_absen"]}',
                                  style: TextStyle(
                                    color: secondary,
                                    fontWeight: medium,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         width: MediaQuery.of(context).size.width / 4.5,
                  //         // decoration: BoxDecoration(
                  //         //   color: primarySoft,
                  //         // ),
                  //         child: Text(
                  //           'Nama',
                  //           style: TextStyle(
                  //             color: kWhiteColor,
                  //             fontWeight: medium,
                  //             fontSize: 14,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(child: Text(':')),
                  //     Expanded(
                  //       flex: 3,
                  //       child: Container(
                  //         alignment: Alignment.centerRight,
                  //         child: Text(
                  //           '${siswaData.data!.firstName} ${siswaData.data!.lastName}',
                  //           style: TextStyle(
                  //             color: kWhiteColor,
                  //             fontWeight: medium,
                  //             fontSize: 14,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 12),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Kelas',
                  //       style: TextStyle(
                  //         color: kWhiteColor,
                  //         fontWeight: medium,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //     Text(
                  //       '${siswaData.data!.kelas}',
                  //       style: TextStyle(
                  //         color: kWhiteColor,
                  //         fontWeight: medium,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 12),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Semester',
                  //       style: TextStyle(
                  //         color: kWhiteColor,
                  //         fontWeight: medium,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //     Text(
                  //       '${siswaData.data!.semester}',
                  //       style: TextStyle(
                  //         color: kWhiteColor,
                  //         fontWeight: medium,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 12),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Pertemuan',
                  //       style: TextStyle(
                  //         color: kWhiteColor,
                  //         fontWeight: medium,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Ke-${siswaData.data!.additionalData!['count_pertemuan']}',
                  //       style: TextStyle(
                  //         color: kWhiteColor,
                  //         fontWeight: medium,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      );
    }

    /// * END WIDGET CARD

    return Scaffold(
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        color: kWhiteColor,
        child: IconTheme(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Container(
              height: 44,
              margin: EdgeInsets.only(bottom: 18),
              child: ButtonWidget(
                padding: EdgeInsets.symmetric(horizontal: 30),
                title: 'Konfirmasi',
                colors: allColor[7],
                fontSize: 17,
                onTap: () {},
              )),
        ),
      ),
      backgroundColor: kBackgorundScaffold,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          centerTitle: true,
          elevation: 0.2,
          title: Text(
            'Konfirmasi',
            style: TextStyle(letterSpacing: 0.5, fontSize: 18),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                widget.closeCameraScreen();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            );
          }),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          widget.closeCameraScreen();
          return shouldPop;
        },
        child: BlocBuilder<ScanSiswaCubit, ScanSiswaState>(
          builder: (context, state) {
            if (state is ScanSiswaSuccess) {
              final data = state.siswaData;
              print('Status ==> ${state.siswaData.status}');
              return RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<ScanSiswaCubit>()
                      .getSiswaByUsername(username: widget.username);
                },
                child: ListView(
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 20,
                  ),
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  children: [
                    /// * NOTE: CARD WIDGET
                    cardWidget(data),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keterangan Kehadiran',
                            style: TextStyle(
                              fontWeight: medium,
                              fontSize: 18,
                            ),
                          ),

                          cardRiwayatAbsen(data),

                          // Container(
                          //   margin: EdgeInsets.only(top: 16),
                          //   padding: EdgeInsets.symmetric(vertical: 10),
                          //   decoration: BoxDecoration(
                          //     color: primaryExtraSoft,
                          //     borderRadius: BorderRadius.circular(18),
                          //   ),
                          //   child:
                          //       BlocConsumer<AbsenSiswaCubit, AbsenSiswaState>(
                          //     listener: (context, state) {
                          //       if (state is AbsenSiswaSuccess) {
                          //         context.read<PageCubit>().setPage(0);
                          //         Navigator.pushNamedAndRemoveUntil(
                          //             context, '/mainGuru', (route) => false);
                          //       } else if (state is AbsenSiswaFailure) {
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(
                          //             content: Text(
                          //               '${state.error}',
                          //               style: TextStyle(
                          //                 color: secondary,
                          //               ),
                          //             ),
                          //             backgroundColor: allColor[1],
                          //             behavior: SnackBarBehavior.floating,
                          //             action: SnackBarAction(
                          //               label: 'Dismiss',
                          //               disabledTextColor: Colors.white,
                          //               textColor: secondary,
                          //               onPressed: () {
                          //                 //Do whatever you want
                          //               },
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //     },
                          //     builder: (context, state) {
                          //       return Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceAround,
                          //         children: [

                          //           // ButtonMenuKeterangan(
                          //           //   icons: Icons.check,
                          //           //   iconColors: successPrimary,
                          //           //   title: 'Siswa Hadir',
                          //           //   onTap: () {
                          //           //     setState(() {
                          //           //       ket = 'H';
                          //           //     });
                          //           //     context
                          //           //         .read<AbsenSiswaCubit>()
                          //           //         .absenSiswa(
                          //           //           mengajarID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mengajar_id'],
                          //           //           siswaID:
                          //           //               data.additionalData!['data']
                          //           //                   ['siswa_id'],
                          //           //           keterangan: ket,
                          //           //           mapelID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mapel_id'],
                          //           //         );
                          //           //   },
                          //           // ),
                          //           // ButtonMenuKeterangan(
                          //           //   icons: Icons.close,
                          //           //   iconColors: kErrorColor,
                          //           //   bgColors: errorExtraSoft,
                          //           //   title: 'Siswa Absen',
                          //           //   onTap: () {
                          //           //     setState(() {
                          //           //       ket = 'A';
                          //           //     });
                          //           //     context
                          //           //         .read<AbsenSiswaCubit>()
                          //           //         .absenSiswa(
                          //           //           mengajarID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mengajar_id'],
                          //           //           siswaID:
                          //           //               data.additionalData!['data']
                          //           //                   ['siswa_id'],
                          //           //           keterangan: ket,
                          //           //           mapelID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mapel_id'],
                          //           //         );
                          //           //   },
                          //           // ),
                          //           // ButtonMenuKeterangan(
                          //           //   icons: Icons.notes,
                          //           //   iconColors: primary,
                          //           //   bgColors: primaryExtraSoft,
                          //           //   title: 'Siswa Izin',
                          //           //   onTap: () {
                          //           //     setState(() {
                          //           //       ket = 'I';
                          //           //     });
                          //           //     print(
                          //           //         '${data.additionalData!["data"]["siswa_id"]}');
                          //           //     context
                          //           //         .read<AbsenSiswaCubit>()
                          //           //         .absenSiswa(
                          //           //           mengajarID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mengajar_id'],
                          //           //           siswaID:
                          //           //               data.additionalData!['data']
                          //           //                   ['siswa_id'],
                          //           //           keterangan: ket,
                          //           //           mapelID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mapel_id'],
                          //           //         );
                          //           //   },
                          //           // ),
                          //           // ButtonMenuKeterangan(
                          //           //   icons: Icons.add_box,
                          //           //   iconColors: successSoft,
                          //           //   bgColors: successExtraSoft,
                          //           //   title: 'Siswa Sakit',
                          //           //   onTap: () {
                          //           //     setState(() {
                          //           //       ket = 'S';
                          //           //     });
                          //           //     context
                          //           //         .read<AbsenSiswaCubit>()
                          //           //         .absenSiswa(
                          //           //           mengajarID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mengajar_id'],
                          //           //           siswaID:
                          //           //               data.additionalData!['data']
                          //           //                   ['siswa_id'],
                          //           //           keterangan: ket,
                          //           //           mapelID:
                          //           //               data.additionalData!['data']
                          //           //                   ['mapel_id'],
                          //           //         );
                          //           //   },
                          //           // ),
                          //         ],
                          //       );
                          //     },
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is ScanSiswaFailure) {
              ///
              /// * NOTE: ERROR VIEW ON PAGE
              ///
              return ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 80,
                        top: MediaQuery.of(context).size.height / 6),
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.center,
                      width: 48,
                      height: 48,
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 100,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          'QR Code tidak sah',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          '${state.error}',
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 18),
                        ButtonWidget(
                          title: 'Scan Ulang',
                          onTap: () {
                            widget.closeCameraScreen();
                            Navigator.pop(context);
                          },
                          height: 44,
                          width: MediaQuery.of(context).size.width / 1.5,
                          colors: primary,
                          fontSize: 20,
                          borderRadiusCircular: 12,
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
