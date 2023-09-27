import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/services/dio_download.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IDCardPage extends StatelessWidget {
  const IDCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgorundScaffold,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          foregroundColor: kBlackColor,
          backgroundColor: kBackgorundScaffold,
          elevation: 0.2,
          title: Text(
            'Kartu Pelajar',
            style: TextStyle(
              fontWeight: medium,
              fontSize: 18,
              color: allColor[7],
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<UserSiswaCubit>().getCurrentUser();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: allColor[7],
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 5,
        ),
        // color: secondaryPrimary,
        child: BlocBuilder<UserSiswaCubit, UserSiswaState>(
          builder: (context, state) {
            if (state is UserSiswaSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: kErrorColor,
                    ),
                    child: Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        '${baseUrl}${state.userSiswa.idCard}',
                        height: 335,
                        width: 205,
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.hardEdge,
                    color: successExtraSoft,
                    elevation: 4,
                    type: MaterialType.card,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      highlightColor: Colors.yellow.withOpacity(0.3),
                      splashColor: Colors.red.withOpacity(0.8),
                      focusColor: Colors.green.withOpacity(0.0),
                      hoverColor: Colors.blue.withOpacity(0.8),
                      onTap: () {
                        // print('OK Brooo');
                        DownloadFromAPI().downloadIDCard(
                          // "${state.userSiswa.idCard}",
                          '${state.userSiswa.id}',
                          '${state.userSiswa.firstName} ${state.userSiswa.lastName}.png',
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        width: MediaQuery.of(context).size.width / 3,
                        // decoration: BoxDecoration(color: successExtraSoft),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download_sharp,
                              size: 26,
                              color: successPrimary,
                            ),
                            Text(
                              'Download',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: bold,
                                  color: secondary.withOpacity(0.6)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Column(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
