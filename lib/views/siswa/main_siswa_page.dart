import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/daftar_siswa.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/home_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/profil_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/riwayat_absen.dart';
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
          return RiwayatAbsensiSiswaPage();
        case 2:
          return DaftarKelasSiswaPage();
        case 3:
          return ProfilSiswaPage();

        default:
          return HomeSiswaPage();
      }
    }

    Widget bottomNavigationBar() {
      return Container(
        height: 55,
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonAppBarWidget(
                index: 0,
                title: 'Beranda',
                iconPrimary: Icons.home,
                iconSecondary: Icons.home_outlined,
              ),
              ButtonAppBarWidget(
                index: 1,
                title: 'Riwayat',
                iconPrimary: Icons.history,
                iconSecondary: Icons.history_outlined,
              ),
              ButtonAppBarWidget(
                index: 2,
                title: 'DaftarKelas',
                iconPrimary: Icons.people,
                iconSecondary: Icons.people_outline,
              ),
              ButtonAppBarWidget(
                index: 3,
                title: 'Akun',
                iconPrimary: Icons.account_circle,
                iconSecondary: Icons.account_circle_outlined,
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
