import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/qr_siswa_page.dart';
import 'package:flutter/material.dart';

class HomeSiswaPage extends StatelessWidget {
  const HomeSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
            height: MediaQuery.of(context).size.height / 4.5,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(defaultRadius),
                bottomRight: Radius.circular(defaultRadius),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UPT SPF SMPN2 MAKASSAR',
                  style: TextStyle(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: medium,
                      letterSpacing: 0.2),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Hai,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: regular,
                        wordSpacing: 1,
                        color: kWhiteColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 4),
                    Container(
                      child: Text(
                        'Ananda Putri',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: medium,
                          wordSpacing: 1,
                          color: kWhiteColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QrSiswaPage();
                            }));
                          },
                          child: Icon(
                            Icons.qr_code,
                            color: kWhiteColor.withOpacity(0.8),
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  'NISN : 0094125167',
                  style: TextStyle(
                      color: kWhiteColor.withOpacity(0.9),
                      fontWeight: regular,
                      fontSize: 14,
                      letterSpacing: 0.8),
                ),
                SizedBox(height: 2),
                Text(
                  'Kelas : VIII-1',
                  style: TextStyle(
                      color: kWhiteColor.withOpacity(0.9),
                      fontWeight: regular,
                      fontSize: 14,
                      letterSpacing: 0.8),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kategori Menu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
