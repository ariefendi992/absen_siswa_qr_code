import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/Absensi/riwayat_absen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuruRiwayatAbsensi extends StatefulWidget {
  const GuruRiwayatAbsensi({super.key});

  @override
  State<GuruRiwayatAbsensi> createState() => _GuruRiwayatAbsensiState();
}

class _GuruRiwayatAbsensiState extends State<GuruRiwayatAbsensi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget riwayatAbsensi(Map<String, List<RAbsensiModel>> riwayatAbsen) {
      return Column(
        children: riwayatAbsen.entries
            .map((e) => RiwayatAbsenWidget(e.key, e.value))
            .toList(),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: secondary,
          title: Text(
            'Riwayat Absensi',
            style: TextStyle(
              fontSize: 18,
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
      body: BlocConsumer<AbsenSiswaCubit, AbsenSiswaState>(
        listener: (context, state) {
          if (state is RiwayatAbsenStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${state.error}',
                  style: TextStyle(
                    color: secondary,
                  ),
                ),
                backgroundColor: errorSoft,
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Dismiss',
                  disabledTextColor: Colors.white,
                  textColor: secondary,
                  onPressed: () {
                    //Do whatever you want
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is RiwayatAbsenStateSuccess) {
            return ListView(
              // padding: EdgeInsets.symmetric(horizontal: 0),
              children: [
                riwayatAbsensi(state.riwayatAbsen),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
