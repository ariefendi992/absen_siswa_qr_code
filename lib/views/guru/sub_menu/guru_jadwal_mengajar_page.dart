import 'package:absen_siswa_qr_code/cubit/master/jadwal/jumat/jadwal_jumat_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/kamis/jadwal_kamis_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/rabu/jadwal_rabu_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/selasa/jadwal_selasa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/senin/jadwal_senin_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
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
  List<JadwalMengajarSepekanModel> jadwalSepekan = [];
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  Future initS() async {
    final jadwalSepekan = await ApiUserGuru().getJadwalMengajarSepekan(query);
    setState(() {
      this.jadwalSepekan = jadwalSepekan;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget hariSenin() {
      return BlocBuilder<JadwalSeninCubit, JadwalSeninState>(
        builder: (context, state) {
          if (state is JadwalSeninSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'SENIN',
                      style: TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      // flex: 40,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: state.jadwal.map((e) {
                    return JadwalMengajarCard(
                      hari: e.hari!,
                      jamMulai: e.jamMulai!,
                      jamSelesai: e.jamSelesai!,
                      kelas: e.kelas!,
                      mapel: e.mapel!,
                    );
                  }).toList(),
                ),
                SizedBox(height: 12),
              ],
            );
          } else if (state is JadwalSeninFail) {
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    Widget hariSelasa() {
      return BlocBuilder<JadwalSelasaCubit, JadwalSelasaState>(
        builder: (context, state) {
          if (state is JadwalSelasaSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'SELASA',
                      style: TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      // flex: 40,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: state.jadwal.map((e) {
                    return JadwalMengajarCard(
                      hari: e.hari!,
                      jamMulai: e.jamMulai!,
                      jamSelesai: e.jamSelesai!,
                      kelas: e.kelas!,
                      mapel: e.mapel!,
                    );
                  }).toList(),
                ),
                SizedBox(height: 12),
              ],
            );
          } else if (state is JadwalSelasaFail) {
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    Widget hariRabu() {
      return BlocBuilder<JadwalRabuCubit, JadwalRabuState>(
        builder: (context, state) {
          if (state is JadwalRabuSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'RABU',
                      style: TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      // flex: 40,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: state.jadwal.map((e) {
                    return JadwalMengajarCard(
                      hari: e.hari!,
                      jamMulai: e.jamMulai!,
                      jamSelesai: e.jamSelesai!,
                      kelas: e.kelas!,
                      mapel: e.mapel!,
                    );
                  }).toList(),
                ),
                SizedBox(height: 12),
              ],
            );
          } else if (state is JadwalRabuFail) {
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    Widget hariKamis() {
      return BlocBuilder<JadwalKamisCubit, JadwalKamisState>(
        builder: (context, state) {
          if (state is JadwalKamisSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'KAMIS',
                      style: TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      // flex: 40,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: state.jadwal.map((e) {
                    return JadwalMengajarCard(
                      hari: e.hari,
                      jamMulai: e.jamMulai,
                      jamSelesai: e.jamSelesai,
                      kelas: e.kelas,
                      mapel: e.mapel,
                    );
                  }).toList(),
                ),
                SizedBox(height: 12),
              ],
            );
          } else if (state is JadwalKamisFailure) {
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    Widget hariJumat() {
      return BlocBuilder<JadwalJumatCubit, JadwalJumatState>(
        builder: (context, state) {
          if (state is JadwalJumatSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'JUMAT',
                      style: TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      // flex: 40,
                      child: Divider(
                        thickness: 2,
                        color: secondarySoft,
                        height: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: state.jadwal.map((e) {
                    return JadwalMengajarCard(
                      hari: e.hari!,
                      jamMulai: e.jamMulai!,
                      jamSelesai: e.jamSelesai!,
                      kelas: e.kelas!,
                      mapel: e.mapel!,
                    );
                  }).toList(),
                ),
                SizedBox(height: 12),
              ],
            );
          } else if (state is JadwalJumatFailure) {
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

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
              letterSpacing: 0.5,
              fontSize: 18,
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
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<JadwalSeninCubit>().getJadwalMengajarSenin();
          context.read<JadwalSelasaCubit>().getJadwalMengajarSelasa();
          context.read<JadwalRabuCubit>().getJadwalMengajarRabu();
          context.read<JadwalKamisCubit>().getJadwalMengajarKamis();
          context.read<JadwalJumatCubit>().getJadwalMengajarJumat();
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            hariSenin(),
            // SizedBox(height: 12),
            hariSelasa(),
            // SizedBox(height: 12),
            hariRabu(),
            // SizedBox(height: 12),
            hariKamis(),
            // SizedBox(height: 12),
            hariJumat(),
            // SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
