import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/widget_riwayat_absen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiswaRiwayatAbsensiPage extends StatefulWidget {
  const SiswaRiwayatAbsensiPage({super.key});

  @override
  State<SiswaRiwayatAbsensiPage> createState() =>
      _SiswaRiwayatAbsensiPageState();
}

class _SiswaRiwayatAbsensiPageState extends State<SiswaRiwayatAbsensiPage> {
  @override
  void initState() {
    context.read<AbsenSiswaCubit>().fetchRiwayatAbsenSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget fetchRiwayatAbsenSiswa(
        Map<String, List<RiwayatAbsenSiswaModel>> riwayatAbsen) {
      return Column(
        children: riwayatAbsen.entries
            .map((e) => WidgetRiwayatAbsenSiswaCard(e.key, e.value))
            .toList(),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0.2,
          title: Text(
            'Riwayat Absen',
            style: TextStyle(color: allColor[7], fontSize: 18),
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
                  color: allColor[7],
                ),
              );
            },
          ),
        ),
      ),
      body: BlocBuilder<AbsenSiswaCubit, AbsenSiswaState>(
        builder: (context, state) {
          if (state is RiwayatAbsenSiswaSuccess) {
            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              children: [
                fetchRiwayatAbsenSiswa(state.riwayatAbsen),
              ],
            );
          } else if (state is RiwayatAbsenSiswaFail) {
            return Center(
              child: Text(
                '${state.error}',
                style: TextStyle(fontSize: 14, color: allColor[9]),
              ),
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
