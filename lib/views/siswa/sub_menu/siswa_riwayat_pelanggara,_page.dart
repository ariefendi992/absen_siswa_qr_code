import 'package:absen_siswa_qr_code/cubit/master/pelanggaran/data_pelanggaran_cubit.dart';
import 'package:absen_siswa_qr_code/models/pelanggaran_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/siswa/wiget_riwayat_pelanggaran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiswaRiwayatPelanggaranPage extends StatefulWidget {
  const SiswaRiwayatPelanggaranPage({super.key});

  @override
  State<SiswaRiwayatPelanggaranPage> createState() =>
      _SiswaRiwayatPelanggaranPageState();
}

class _SiswaRiwayatPelanggaranPageState
    extends State<SiswaRiwayatPelanggaranPage> {
  @override
  void initState() {
    context.read<DataPelanggaranCubit>().fetchRiwayatPelanggaranSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget riwayatPelanggaran(List<RiwayatPelanggaranSiswaModel> pelanggaran) {
      return Column(
        children: pelanggaran.map((e) => WidgetRiwayatPelanggaran(e)).toList(),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: allColor[7],
          elevation: 0.2,
          title: Text(
            'RiwayatPelanggaran',
            style: TextStyle(
              color: allColor[7],
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: ((context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            }),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                      color: errorExtraSoft,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 32,
                        color: allColor[9],
                      ),
                    ),
                  ),
                  Text(
                    'Dibina',
                    style: TextStyle(
                      fontSize: 14,
                      color: allColor[7],
                      fontWeight: medium,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                      color: allColor[4],
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 32,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Text(
                    'Evaluasi',
                    style: TextStyle(
                      fontSize: 14,
                      color: allColor[7],
                      fontWeight: medium,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(
            color: secondaryExtraSoft,
            height: 4,
            thickness: 1.6,
            indent: 4,
            endIndent: 4,
          ),
          SizedBox(height: 16),
          // WidgetRiwayatPelanggaran(),
          // WidgetRiwayatPelanggaran(),
          BlocBuilder<DataPelanggaranCubit, DataPelanggaranState>(
            builder: (context, state) {
              if (state is RiwayatPelanggaranSiswaSuccess) {
                final pelanggaran = state.pelanggaran;
                return riwayatPelanggaran(pelanggaran);
              } else if (state is RiwayatPelanggaranSiswaFail) {
                return Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history_rounded,
                        size: 32,
                        color: allColor[10],
                      ),
                      SizedBox(height: 6),
                      Text(
                        '${state.error}',
                        style: TextStyle(
                          fontSize: 14,
                          color: allColor[10],
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
