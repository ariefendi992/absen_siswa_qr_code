import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class GuruRiwayatAbsensi extends StatelessWidget {
  const GuruRiwayatAbsensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: secondary,
          title: Text(
            'Daftar RiwayatAbsensi',
            style: TextStyle(
              fontWeight: bold,
            ),
          ),
          centerTitle: true,
          elevation: 0.2,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 22,
                ),
              );
            },
          ),
        ),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Material(
            color: secondaryExtraSoft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12),
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selasa, 06 Juni 2023',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: medium,
                      color: allColor[7],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: secondaryExtraSoft, width: 0.8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: primarySoft,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama',
                                style: TextStyle(
                                  color: secondary,
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Kelas',
                                style: TextStyle(
                                  color: secondary,
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              ':',
                              style: TextStyle(
                                fontWeight: medium,
                              ),
                            ),
                            Text(
                              ':',
                              style: TextStyle(
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rijal Dhaffa Nugraha',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                'VIII-1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: medium,
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
            ),
          ),
          Material(
            color: secondaryExtraSoft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selasa, 06 Juni 2023',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: medium,
                      color: allColor[7],
                    ),
                  ),
                  Row(
                    children: [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
