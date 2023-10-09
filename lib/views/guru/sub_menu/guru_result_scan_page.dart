import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
// import 'package:absen_siswa_qr_code/cubit/user/guru/scan_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:absen_siswa_qr_code/views/guru/menu/guru_scan_qr_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/Absensi/widget_riwayat_absen_mapel.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';

class GuruResultScanPage extends StatefulWidget {
  final ScanSiswaModel resulScanData;
  final String username;
  final Function() closeCameraScreen;

  const GuruResultScanPage({
    required this.username,
    required this.closeCameraScreen,
    required this.resulScanData,
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
  bool showRiwayat = false;

  @override
  void initState() {
    super.initState();
    // context.read<ScanSiswaCubit>().getSiswaByUsername(
    //       username: widget.username,
    //     );
  }

  @override
  Widget build(BuildContext context) {
    Widget cardRiwayatAbsen(ScanSiswaModel siswaData) {
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
            )
          ],
        ),
      );
    }

    /// * END WIDGET CARD

    Widget btnKonfirmasi() {
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
                onConfirmBtnTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuruScanPage(),
                      ),
                      (route) => false);
                },
                showCancelBtn: true,
                onCancelBtnTap: () {
                  Navigator.pop(context);
                });
          }
        },
        builder: (context, state) {
          return Container(
            height: 44,
            margin: EdgeInsets.only(bottom: 18),
            child: ButtonWidget(
              padding: EdgeInsets.symmetric(horizontal: 30),
              title: 'Konfirmasi',
              colors: primary,
              fontSize: 17,
              letterSpacing: 0.3,
              onTap: () {
                context.read<AbsenSiswaCubit>().absenSiswa(
                      mengajarID: widget.resulScanData.additionalData!['data']
                          ['mengajar_id'],
                      siswaID: widget.resulScanData.additionalData!['data']
                          ['siswa_id'],
                      keterangan: 'H',
                      mapelID: widget.resulScanData.additionalData!['data']
                          ['mapel_id'],
                    );
              },
            ),
          );
        },
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
          child: btnKonfirmasi(),
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
        child: ListView(
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
            cardWidget(widget.resulScanData),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          showRiwayat
                              ? Icons.arrow_right_outlined
                              : Icons.arrow_drop_down_outlined,
                          // size: 24,
                        ),
                      )
                    ],
                  ),
                  showRiwayat
                      ? SizedBox()
                      : cardRiwayatAbsen(widget.resulScanData),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
