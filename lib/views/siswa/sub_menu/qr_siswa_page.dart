import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrSiswaPage extends StatefulWidget {
  const QrSiswaPage({super.key});

  @override
  State<QrSiswaPage> createState() => _QrSiswaPageState();
}

class _QrSiswaPageState extends State<QrSiswaPage> {
  @override
  Widget build(BuildContext context) {
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
              'My QR Code',
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
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    context.read<PageCubit>().setPage(0);
                    Navigator.pushReplacementNamed(context, '/mainSiswa');
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                  ));
            }),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: BlocBuilder<UserSiswaCubit, UserSiswaState>(
            builder: (context, state) {
              if (state is UserSiswaSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state.userSiswa.qrCode != null
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(86),
                                child: Image.network(
                                  '$baseUrl/${state.userSiswa.qrCode}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 40),
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ButtonWidget(
                              title: 'Generate QR Code',
                              onTap: () {
                                context.read<UserSiswaCubit>().generatedQrCode(
                                    id: state.userSiswa.id.toString());
                              },
                              height: 45,
                              fontSize: 18,
                            ),
                          ),
                  ],
                );
              } else if (state is UserSiswaFailed) {
                return RefreshIndicator(
                  onRefresh: () async {
                    final id = await CustomStorage().getStorage('id');
                    context.read<UserSiswaCubit>().getCurrentUser(id: id);
                  },
                  child: ListView(
                    shrinkWrap: false,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            state.error,
                            style: TextStyle(
                              fontWeight: medium,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
