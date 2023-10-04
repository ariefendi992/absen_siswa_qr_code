import 'package:absen_siswa_qr_code/cubit/master/daftar_kelas_ajar_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/card_daftar_kelas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuruGetSiswaKelas extends StatefulWidget {
  const GuruGetSiswaKelas({super.key});

  @override
  State<GuruGetSiswaKelas> createState() => _GuruGetSiswaKelasState();
}

class _GuruGetSiswaKelasState extends State<GuruGetSiswaKelas> {
  @override
  void initState() {
    super.initState();

    context.read<KelasAjarCubit>().getKelasAjar();
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
            'Daftar Kelas Ajar',
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
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<KelasAjarCubit>().getKelasAjar();
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                'Dafar Kelas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            daftarKelasAjar(),
            // CardDaftarKelasWidget(),
            // CardDaftarKelasWidget(),
          ],
        ),
      ),
    );
  }

  Widget daftarKelasAjar() {
    return BlocBuilder<KelasAjarCubit, KelasAjarState>(
      builder: (context, state) {
        if (state is KelasAjarSuccess) {
          return Column(
            children: state.daftarKelas.map((daftarKelas) {
              return CardDaftarKelasWidget(daftarKelas);
            }).toList(),
          );
        } else if (state is KelasAjarFailure) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                color: successExtraSoft,
                child: Center(
                  child: Text(
                    '${state.error}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is KelasAjarLoading) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
