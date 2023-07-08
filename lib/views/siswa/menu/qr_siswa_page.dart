import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
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
        // extendBodyBehindAppBar: true,
        backgroundColor: kBackgorundScaffold,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            foregroundColor: kBlackColor,
            backgroundColor: kBackgorundScaffold,
            elevation: 0.2,
            title: Text(
              'QR Code Siswa',
              style: TextStyle(
                fontWeight: medium,
                fontSize: 18,
                color: allColor[7],
              ),
            ),
            centerTitle: true,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(30),
            //   ),
            // ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: allColor[7],
                    ));
              },
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: BlocBuilder<UserSiswaCubit, UserSiswaState>(
            builder: (context, state) {
              if (state is UserSiswaSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    state.userSiswa.qrCode != null
                        ? Container(
                            margin: EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 20,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              elevation: 2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 22,
                                  vertical: 22,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  // border: Border.all(
                                  //   color: kPrimaryColor.withOpacity(0.15),
                                  //   style: BorderStyle.solid,
                                  //   width: 5,
                                  // ),
                                ),
                                child: Column(
                                  children: [
                                    Material(
                                      elevation: 4,
                                      borderRadius: BorderRadius.circular(12),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(100),
                                          child: Image.network(
                                            '$baseUrl/${state.userSiswa.qrCode}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '${state.userSiswa.nisn.toString()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: medium,
                                        color: allColor[7],
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Divider(
                                      height: 2,
                                      thickness: 1.2,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Tunjukkan QR Code ke Guru untuk melakukan absen, sebelum pelajaran',
                                      style: TextStyle(
                                        color: allColor[7],
                                      ),
                                    )
                                    // SizedBox(height: 2),
                                  ],
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
                    state.userSiswa.qrCode != null
                        ? Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              'SCAN ME!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: bold,
                                color: allColor[7],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                );
              } else if (state is UserSiswaFailed) {
                return RefreshIndicator(
                  onRefresh: () async {
                    // final id = await CustomStorage().getStorage('id');
                    // context.read<UserSiswaCubit>().getCurrentUser(id: id);
                    context.read<UserSiswaCubit>().getCurrentUser();
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
