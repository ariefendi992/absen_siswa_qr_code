import 'package:absen_siswa_qr_code/cubit/master/siswa_mapel_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/mapel_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapelPage extends StatefulWidget {
  final String id;

  const MapelPage(this.id, {super.key});

  @override
  State<MapelPage> createState() => _MapelPageState();
}

class _MapelPageState extends State<MapelPage> {
  @override
  void initState() {
    super.initState();
    context.read<SiswaMapelCubit>().getMapelByKelasId(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    Widget mapel(List<MapelSiswaModel> mapels) {
      return Column(
          children: mapels.map((e) {
        return MapelCardWiget(e);
      }).toList());
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgorundScaffold,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          foregroundColor: kWhiteBlueColor,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: Text(
            'Daftar MataPelajaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(30))),
        ),
      ),
      body: Material(
        color: kBackgorundScaffold,
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: defaultPadding,
            right: defaultPadding,
            bottom: 10,
          ),
          child: BlocConsumer<SiswaMapelCubit, SiswaMapelState>(
            listener: (context, state) {
              if (state is SiswaMapelFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is SiswaMapelSuccess) {
                return ListView(
                  children: [
                    mapel(state.mapels),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
