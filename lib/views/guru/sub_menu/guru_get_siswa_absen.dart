import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/scan_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:absen_siswa_qr_code/views/widgets/Absensi/widget_riwayat_absen_mapel.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_keterangan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';

class GuruGetSiswaAbsen extends StatefulWidget {
  final String username;
  const GuruGetSiswaAbsen({
    super.key,
    required this.username,
  });

  @override
  State<GuruGetSiswaAbsen> createState() => _GuruGetSiswaAbsenState();
}

class _GuruGetSiswaAbsenState extends State<GuruGetSiswaAbsen> {
  bool showRiwayat = false;

  @override
  void initState() {
    super.initState();

    context
        .read<ScanSiswaCubit>()
        .getSiswaByUsername(username: widget.username);

    setState(() {
      showRiwayat = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Note: Card DETAIL INFO SISWA
    ///
    Widget detailSiswa(ScanSiswaModel siswaData) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: primary,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern-2.png'),
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
                '${siswaData.additionalData!["data"]["today"]}',
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: siswaData.data!.additionalData![
                                              "status_absen"] ==
                                          'Telah Absen'
                                      ? newColorList[0]
                                      : allColor[8],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '${siswaData.data!.additionalData!["status_absen"]}',
                                  style: TextStyle(
                                    color: siswaData.data!.additionalData![
                                                "status_absen"] !=
                                            'Telah Absen'
                                        ? secondary
                                        : kWhiteColor,
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
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget btnAbsen() {
      return BlocConsumer<AbsenSiswaCubit, AbsenSiswaState>(
        listener: (context, state) {
          if (state is AbsenSiswaSuccess) {
            QuickAlert.show(
              title: 'Sukses',
              text: 'Absen Berhasil...!',
              context: context,
              type: QuickAlertType.success,
              confirmBtnText: 'Lanjutkan',
              onConfirmBtnTap: () {
                context.read<PageCubit>().setPage(0);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/mainGuru', (route) => false);
              },
            );
          } else if (state is AbsenSiswaFailure) {
            QuickAlert.show(
              title: 'Gaga!',
              text: 'Absen telah dilakukan!',
              textAlignment: TextAlign.center,
              context: context,
              type: QuickAlertType.error,
              confirmBtnText: 'Scan',
              cancelBtnText: 'Tutup',
              // onConfirmBtnTap: () {
              //   Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => GuruScanPage(),
              //       ),
              //       (route) => false);
              // },
              showConfirmBtn: false,
              showCancelBtn: true,
              onCancelBtnTap: () {
                Navigator.pop(context);
                setState(() {
                  showRiwayat = false;
                });
              },
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<ScanSiswaCubit, ScanSiswaState>(
            builder: (context, state) {
              if (state is ScanSiswaSuccess) {
                final result = state.siswaData.additionalData!['data'];
                return Container(
                  height: 66,
                  margin: EdgeInsets.only(bottom: 24, left: 20, right: 20),
                  decoration: BoxDecoration(
                    // color: primaryBgCard,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    elevation: 2,
                    // color: primaryExtraSoft,
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonMenuKeterangan(
                          icons: Icons.notes,
                          iconColors: primary,
                          bgColors: primaryExtraSoft,
                          iconSize: 20,
                          title: 'IZIN',
                          height: 32,
                          width: 32,
                          fontSize: 13,
                          fontWeight: bold,
                          onTap: () {
                            context.read<AbsenSiswaCubit>().absenSiswa(
                                  mengajarID: result['mengajar_id'],
                                  siswaID: result['siswa_id'],
                                  keterangan: 'I',
                                  mapelID: result['mapel_id'],
                                );
                          },
                        ),
                        ButtonMenuKeterangan(
                          icons: Icons.add_box,
                          iconColors: successSoft,
                          bgColors: successExtraSoft,
                          iconSize: 20,
                          title: 'SAKIT',
                          height: 32,
                          width: 32,
                          fontSize: 13,
                          fontWeight: bold,
                          onTap: () {
                            context.read<AbsenSiswaCubit>().absenSiswa(
                                  mengajarID: result['mengajar_id'],
                                  siswaID: result['siswa_id'],
                                  keterangan: 'S',
                                  mapelID: result['mapel_id'],
                                );
                          },
                        ),
                        ButtonMenuKeterangan(
                          icons: Icons.close,
                          iconColors: kErrorColor,
                          bgColors: errorExtraSoft,
                          iconSize: 20,
                          title: 'ALPA',
                          height: 32,
                          width: 32,
                          fontSize: 13,
                          fontWeight: bold,
                          onTap: () {
                            context.read<AbsenSiswaCubit>().absenSiswa(
                                  mengajarID: result['mengajar_id'],
                                  siswaID: result['siswa_id'],
                                  keterangan: 'A',
                                  mapelID: result['mapel_id'],
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container(
                height: 66,
                margin: EdgeInsets.only(bottom: 24, left: 20, right: 20),
                decoration: BoxDecoration(
                  // color: primaryBgCard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  elevation: 2,
                  // color: primaryExtraSoft,
                  borderRadius: BorderRadius.circular(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonMenuKeterangan(
                        icons: Icons.notes,
                        iconColors: primary,
                        bgColors: primaryExtraSoft,
                        iconSize: 20,
                        title: 'IZIN',
                        height: 32,
                        width: 32,
                        fontSize: 13,
                        fontWeight: bold,
                        onTap: () {},
                      ),
                      ButtonMenuKeterangan(
                        icons: Icons.add_box,
                        iconColors: successSoft,
                        bgColors: successExtraSoft,
                        iconSize: 20,
                        title: 'SAKIT',
                        height: 32,
                        width: 32,
                        fontSize: 13,
                        fontWeight: bold,
                        onTap: () {},
                      ),
                      ButtonMenuKeterangan(
                        icons: Icons.close,
                        iconColors: kErrorColor,
                        bgColors: errorExtraSoft,
                        iconSize: 20,
                        title: 'ALPA',
                        height: 32,
                        width: 32,
                        fontSize: 13,
                        fontWeight: bold,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }

    Widget RiwayatAbsen(ScanSiswaModel siswaData) {
      return Column(
        children: siswaData.dataRiwayat!.data
            .map((e) => WidgetCardRiwayatAbsenMapel(e))
            .toList(),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        color: kWhiteColor,
        child: IconTheme(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: btnAbsen(),
        ),
      ),
      backgroundColor: kBackgorundScaffold,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0.3,
          backgroundColor: kBackgorundScaffold,
          foregroundColor: secondary,
          title: Text('Absen Siswa'),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              );
            },
          ),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: BlocBuilder<ScanSiswaCubit, ScanSiswaState>(
        builder: (context, state) {
          if (state is ScanSiswaSuccess) {
            return ListView(
              padding:
                  EdgeInsets.only(top: 10, right: 20, bottom: 20, left: 20),
              children: [
                detailSiswa(state.siswaData),
                Row(
                  children: [
                    Text(
                      'Riwayat Absen',
                      style: TextStyle(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showRiwayat = !showRiwayat;
                        });
                      },
                      highlightColor: primaryBgCard,
                      splashColor: primaryExtraSoft,
                      icon: Icon(
                        showRiwayat == false
                            ? Icons.arrow_right_outlined
                            : Icons.arrow_drop_down_outlined,
                        // size: 24,
                      ),
                    ),
                  ],
                ),
                showRiwayat == false
                    ? SizedBox()
                    : RiwayatAbsen(state.siswaData)
              ],
            );
          }
          return Center();
        },
      ),
    );
  }
}
