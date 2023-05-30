import 'package:absen_siswa_qr_code/cubit/master/daftar_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_daftar_siswa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuruGetDaftarSiswa extends StatefulWidget {
  final DaftarKelasAjarModel kelas;
  const GuruGetDaftarSiswa(this.kelas, {super.key});

  @override
  State<GuruGetDaftarSiswa> createState() => _GuruGetDaftarSiswaState();
}

class _GuruGetDaftarSiswaState extends State<GuruGetDaftarSiswa> {
  bool searchActive = false;

  @override
  void initState() {
    super.initState();
    context.read<DaftarSiswaCubit>()
      ..getDataSiswa(kelasId: widget.kelas.kelasId);
  }

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
              cardHeader(),

              ///* SEARCH BUTTON AND FIELD
              // Container(
              //   margin: EdgeInsets.only(top: 8),
              //   child: Material(
              //     elevation: 6,
              //     borderRadius: BorderRadius.circular(18),
              //     child: AnimatedContainer(
              //       width:
              //           !searchActive ? 50 : MediaQuery.of(context).size.width,
              //       duration: Duration(milliseconds: 2000),
              //       decoration: BoxDecoration(
              //         color: primarySoft,
              //         borderRadius: BorderRadius.circular(18),
              //       ),
              //       child: Row(
              //         children: [
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       searchActive = !searchActive;
              //     });
              //   },
              //   child: Container(
              //     padding: EdgeInsets.all(8),
              //     child: Icon(
              //       Icons.search_rounded,
              //       color: secondary,
              //     ),
              //   ),
              // )
              //     ],
              //   ),
              // ),
              // ),
              // ),
              ///* END SEARCH FIELD

              SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<DaftarSiswaCubit, DaftarSiswaSate>(
                  builder: (context, state) {
                    if (state is DaftarSiswaSuccess) {
                      return ListView(
                        shrinkWrap: true,
                        children: state.daftarSiswa
                            .map((e) => CardDaftarSiswaWidget(
                                  daftarSiswa: e,
                                ))
                            .toList(),
                      );
                    } else if (state is DaftarSiswaFailure) {
                      return Center(
                        child: Text('${state.error}'),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHeader() {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 14,
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
                  '${widget.kelas.kelas}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: bold,
                    color: kWhiteColor,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '${widget.kelas.waliKelas}',
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
              margin: EdgeInsets.only(right: 1),
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
