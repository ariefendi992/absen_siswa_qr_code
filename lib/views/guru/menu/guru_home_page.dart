import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class GuruHomePage extends StatelessWidget {
  const GuruHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        children: [
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 42,
                    height: 42,
                    child: Container(
                      color: primary,
                      child: Center(
                        child: Text(
                          'AE',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontWeight: medium),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'selamat datang',
                      style: TextStyle(
                        fontSize: 12,
                        color: secondarySoft,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ari Efendi',
                      style: TextStyle(
                        fontWeight: medium,
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
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/images/pattern-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                  '196204141987032019',
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
                              'Pendidikan Jasmani, Olahraga & Kesehatan',
                              style: TextStyle(
                                fontSize: 14,
                                color: kWhiteColor,
                              ),
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
        ],
      ),
    );
  }
}
