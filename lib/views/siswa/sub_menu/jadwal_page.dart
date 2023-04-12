import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JadwalPageSiswa extends StatelessWidget {
  const JadwalPageSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kBlackColor,
        backgroundColor: kBackgorundScaffold,
        elevation: 6,
        centerTitle: true,
        title: Text(
          'JadwalBelajar',
          style: TextStyle(
            fontWeight: bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              context.read<PageCubit>().setPage(0);
              Navigator.pushReplacementNamed(context, '/mainSiswa');
            },
            icon: Icon(Icons.arrow_back_ios_new),
          );
        }),
      ),
      body: Center(
        child: Text('Halaman Jadwal Siswa'),
      ),
    );
  }
}
