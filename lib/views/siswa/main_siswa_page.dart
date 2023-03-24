import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/home_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/profil_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/qr_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSiswaPage extends StatelessWidget {
  const MainSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomeSiswaPage();

        case 1:
          return QrSiswaPage();
        case 2:
          return ProfilSiswaPage();

        default:
          return HomeSiswaPage();
      }
    }

    Widget bottomNavigationBar() {
      return Container(
        height: 83,
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonAppBarWidget(
                index: 0,
                title: 'Home',
                icons: Icons.home,
              ),
              ButtonAppBarWidget(
                index: 1,
                title: 'QR Code',
                icons: Icons.qr_code,
              ),
              ButtonAppBarWidget(
                index: 2,
                title: 'Akun',
                icons: Icons.account_circle,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            elevation: 6,
            clipBehavior: Clip.hardEdge,
            color: kWhiteColor,
            child: IconTheme(
                data: IconThemeData(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: bottomNavigationBar()),
          ),
          body: Stack(children: [
            content(currentIndex),
          ]),
        );
      },
    );
  }
}
