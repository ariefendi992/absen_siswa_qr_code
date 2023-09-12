import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class RiwayatAbsenWidget extends StatelessWidget {
  final String tgl;
  final List<RAbsensiModel> riwayatAbsensi;
  const RiwayatAbsenWidget(this.tgl, this.riwayatAbsensi, {super.key});

  @override
  Widget build(BuildContext context) {
    // Widget detailData(RAbsensiModel riwayat) {
    //   return Container(
    //     margin: EdgeInsets.only(bottom: 10),
    //     padding: EdgeInsets.only(bottom: 8),
    //     decoration: BoxDecoration(
    //       border: Border(
    //         bottom: BorderSide(color: secondarySoft, width: 0.8),
    //       ),
    //     ),
    //     child: Row(
    //       children: [
    //         Container(
    //           padding: EdgeInsets.all(4),
    //           margin: EdgeInsets.only(right: 12),
    //           decoration: BoxDecoration(
    //             color: primarySoft,
    //             borderRadius: BorderRadius.circular(100),
    //           ),
    //           child: Center(
    //             child: Icon(
    //               Icons.person_outline_rounded,
    //               color: kWhiteColor,
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 2,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Nama',
    //                 style: TextStyle(
    //                   color: secondary,
    //                   fontSize: 16,
    //                   fontWeight: medium,
    //                 ),
    //               ),
    //               SizedBox(height: 2),
    //               Text(
    //                 'Kelas',
    //                 style: TextStyle(
    //                   color: secondary,
    //                   fontSize: 16,
    //                   fontWeight: medium,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Expanded(
    //             child: Column(
    //           children: [
    //             Text(
    //               ':',
    //               style: TextStyle(
    //                 fontWeight: medium,
    //               ),
    //             ),
    //             Text(
    //               ':',
    //               style: TextStyle(
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ],
    //         )),
    //         Expanded(
    //           flex: 10,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               Text(
    //                 '${riwayat.namaSiswa}',
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   fontWeight: medium,
    //                 ),
    //               ),
    //               Text(
    //                 '${riwayat.kelas}',
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   fontWeight: medium,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget detailData(RAbsensiModel riwayat) {
      return Container(
        padding: EdgeInsets.only(bottom: 8),
        // decoration: BoxDecoration(color: primarySoft),
        child: Column(
          children: [
            Material(
              elevation: 6,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: 10,
                ),
                decoration: BoxDecoration(color: kWhiteColor),
                child: Row(
                  children: [
                    Expanded(
                      // flex: 4,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: primarySoft,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${riwayat.namaSiswa}',
                                style: TextStyle(
                                    fontWeight: medium,
                                    fontSize: 18,
                                    color: kBlackColor),
                              )
                            ],
                          ),
                          Divider(
                            color: secondarySoft,
                            height: 4,
                            indent: 4,
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.room,
                                color: primarySoft,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${riwayat.kelas}',
                                style: TextStyle(
                                    fontWeight: bold, color: kBlackColor),
                              )
                            ],
                          ),
                          Divider(
                            color: secondarySoft,
                            height: 4,
                            indent: 4,
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: primarySoft,
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: riwayat.keterangan == 'Hadir'
                                      ? successPrimary
                                      : riwayat.keterangan == 'Sakit'
                                          ? warning2
                                          : riwayat.keterangan == 'Izin'
                                              ? successSoft
                                              : errorPrimary,
                                ),
                                child: Text(
                                  '${riwayat.keterangan}'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: riwayat.keterangan == 'Sakit'
                                          ? secondary
                                          : kWhiteColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Material(
      color: secondaryExtraSoft,
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.only(left: 24, right: 24, top: 12),
        // padding: EdgeInsets.only(top: 12),
        // margin: EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(color: kWhiteColor),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(color: primaryBgCard),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    color: primary,
                  ),
                  SizedBox(width: 6),
                  Text(
                    '$tgl',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: bold,
                        color: primary,
                        letterSpacing: 0.6),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: riwayatAbsensi.map((e) => detailData(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
