import 'package:absen_siswa_qr_code/cubit/master/jadwal/jadwal_siswa/jadwal_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/card_jadwal_siswa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JadwalPageSiswa extends StatefulWidget {
  const JadwalPageSiswa({super.key});

  @override
  State<JadwalPageSiswa> createState() => _JadwalPageSiswaState();
}

class _JadwalPageSiswaState extends State<JadwalPageSiswa> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget jadwalMapel(Map<String, List<JadwalPelajaranSiswaModel>> jadwal) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: jadwal.entries
            .map((e) => WidgetJadwalMapelSiswa(e.key, e.value))
            .toList(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          backgroundColor: kBackgorundScaffold,
          elevation: 0.2,
          centerTitle: true,
          title: Text(
            'Jadwal',
            style: TextStyle(fontWeight: bold, color: allColor[7]),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
            ),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<JadwalSiswaCubit>().fetchJadwalHarianSiswa();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: allColor[7],
              ),
            );
          }),
        ),
        body: BlocBuilder<JadwalSiswaCubit, JadwalSiswaState>(
            builder: (context, state) {
          if (state is JadwalPelajaranSiswaSuccess) {
            return WillPopScope(
              onWillPop: () async {
                context.read<JadwalSiswaCubit>().fetchJadwalHarianSiswa();
                return true;
              },
              child: ListView(
                children: [
                  jadwalMapel(state.jadwal),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
