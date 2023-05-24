import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<UserSiswaCubit>().getSiswaByUsername(
          username: widget.username,
        );
  }

  @override
  Widget build(BuildContext context) {
    /// * START WIDGET CARD
    Widget cardWidget(state) {
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
                '${state.userSiswa.today}',
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
                        fontSize: 22,
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
                ClipOval(
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.all(1),
                    color: primarySoft,
                    child: SvgPicture.asset(
                      'assets/images/UserCircle.svg',
                      fit: BoxFit.cover,
                      color: kWhiteColor,
                    ),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4.5,
                        // decoration: BoxDecoration(
                        //   color: primarySoft,
                        // ),
                        child: Text(
                          'Nama',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontWeight: medium,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        '${state.userSiswa.firstName} ${state.userSiswa.lastName}',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kelas',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${state.userSiswa.kelas}',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Semester',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${state.userSiswa.semester}',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
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
      backgroundColor: kBackgorundScaffold,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          centerTitle: true,
          elevation: 0.2,
          title: Text(
            'Result Scan',
            style: TextStyle(
              fontWeight: bold,
              letterSpacing: 0.5,
            ),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                widget.closeCameraScreen();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
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
        child: BlocBuilder<UserSiswaCubit, UserSiswaState>(
          builder: (context, state) {
            if (state is UserSiswaSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<UserSiswaCubit>()
                      .getSiswaByUsername(username: widget.username);
                },
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  children: [
                    /// * NOTE: CARD WIDGET
                    cardWidget(state),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keterangan Kehadiran',
                            style: TextStyle(
                              fontWeight: medium,
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: primaryExtraSoft,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonMenuKeterangan(
                                  icons: Icons.check,
                                  iconColors: successPrimary,
                                  title: 'Siswa Hadir',
                                ),
                                ButtonMenuKeterangan(
                                  icons: Icons.close,
                                  iconColors: kErrorColor,
                                  bgColors: errorExtraSoft,
                                  title: 'Siswa Absen',
                                ),
                                ButtonMenuKeterangan(
                                  icons: Icons.notes,
                                  iconColors: primary,
                                  bgColors: primaryExtraSoft,
                                  title: 'Siswa Izin',
                                ),
                                ButtonMenuKeterangan(
                                  icons: Icons.add_box,
                                  iconColors: successSoft,
                                  bgColors: successExtraSoft,
                                  title: 'Siswa Sakit',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is UserSiswaFailed) {
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
