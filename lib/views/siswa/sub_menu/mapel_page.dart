import 'package:absen_siswa_qr_code/cubit/master/siswa_mapel_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
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
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          foregroundColor: kBlackColor,
          backgroundColor: kBackgorundScaffold,
          elevation: 6,
          title: Text(
            'Daftar MataPelajaran',
            style: TextStyle(
              fontWeight: bold,
            ),
          ),
          centerTitle: true,
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
      ),
      body: Material(
        color: kBackgorundScaffold,
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
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
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 30,
                        left: 10,
                        right: 10,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        elevation: 9,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kPrimaryColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: kWhiteBlueColor,
                              //     spreadRadius: 5,
                              //     blurRadius: 3,
                              //     offset: Offset(0, 5),
                              //   ),
                              // ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah MataPelajaran',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kWhiteColor,
                                            fontWeight: medium,
                                            letterSpacing: 0.6),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: kWhiteColor,
                                            fontWeight: medium,
                                            letterSpacing: 0.6),
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        '${state.mapels.length}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kWhiteColor,
                                            fontWeight: medium,
                                            letterSpacing: 0.6),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
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
