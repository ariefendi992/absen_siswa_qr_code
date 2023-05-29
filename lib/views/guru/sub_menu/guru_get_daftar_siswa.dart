import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_daftar_siswa.dart';
import 'package:flutter/material.dart';

class GuruGetDaftarSiswa extends StatefulWidget {
  const GuruGetDaftarSiswa({super.key});

  @override
  State<GuruGetDaftarSiswa> createState() => _GuruGetDaftarSiswaState();
}

class _GuruGetDaftarSiswaState extends State<GuruGetDaftarSiswa> {
  bool searchActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: secondary,
          elevation: 0.2,
          title: Text(
            'Daftar Siswa',
            style: TextStyle(
              fontWeight: bold,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardHeader(context),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(18),
                  child: AnimatedContainer(
                    width:
                        !searchActive ? 50 : MediaQuery.of(context).size.width,
                    duration: Duration(milliseconds: 2000),
                    decoration: BoxDecoration(
                      color: primarySoft,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        // IconButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       searchActive = !searchActive;
                        //     });
                        //   },
                        //   icon: Icon(
                        //     Icons.search_rounded,
                        //   ),
                        // )

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              searchActive = !searchActive;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.search_rounded,
                              color: secondary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CardDaftarSiswaWidget(),
                    CardDaftarSiswaWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHeader(context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: allColor[7],
          image: DecorationImage(
            image: AssetImage('assets/images/pattern-1.png'),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VIII-1',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: bold,
                    color: kWhiteColor,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Dra. Haslinda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: bold,
                    color: kWhiteColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 24),
              child: Icon(
                Icons.class_rounded,
                size: 48,
                color: allColor[6],
                shadows: [
                  Shadow(
                    color: allColor[4],
                    offset: Offset(3, 3.5),
                    blurRadius: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
