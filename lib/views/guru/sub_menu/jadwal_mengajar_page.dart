import 'package:absen_siswa_qr_code/cubit/master/jadwal_mapel_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/jadwal_mengajar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuruJadwalMengajarPage extends StatefulWidget {
  const GuruJadwalMengajarPage({
    super.key,
  });

  @override
  State<GuruJadwalMengajarPage> createState() => _GuruJadwalMengajarPageState();
}

class _GuruJadwalMengajarPageState extends State<GuruJadwalMengajarPage> {
  @override
  void initState() {
    super.initState();
    context.read<JadwalMapelCubit>().getJadwalMengajarByHari(hari: 'senin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          elevation: 0.2,
          title: Text(
            'Jadwal Mengajar',
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
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ));
            },
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SENIN',
                style: TextStyle(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              JadwalMengajarCard(
                kelas: 'VIII-1',
                jamMulai: '07.00',
                jamSelesai: '09.30',
                mapel: 'Pendidikan Jasmani, Olahraga dan Kesehatan',
              ),
              JadwalMengajarCard(
                kelas: 'VIII-1',
                jamMulai: '07.00',
                jamSelesai: '09.30',
                mapel: 'Pendidikan Jasmani, Olahraga dan Kesehatan',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
