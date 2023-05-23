import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/guru/menu/guru_home_page.dart';
import 'package:absen_siswa_qr_code/views/guru/menu/guru_scan_qr_page.dart';
import 'package:absen_siswa_qr_code/views/guru/menu/profil_guru_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainGuruPage extends StatelessWidget {
  const MainGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content(currentIndex) {
      switch (currentIndex) {
        case 0:
          return GuruHomePage();
        case 1:
          return ProfilGuruPage();

        default:
          return GuruHomePage();
      }
    }

    Widget bottomNavigation() {
      return Container(
        height: 58,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonAppBarWidget(
              title: 'Beranda',
              index: 0,
              iconPrimary: Icons.home,
              iconSecondary: Icons.home_outlined,
              colors: primary,
            ),
            ButtonAppBarWidget(title: 'Scan QR'),
            ButtonAppBarWidget(
              title: 'Akun',
              index: 1,
              iconPrimary: Icons.account_circle,
              iconSecondary: Icons.account_circle_outlined,
              colors: primary,
            ),
          ],
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            elevation: 8,
            clipBehavior: Clip.hardEdge,
            color: kWhiteColor,
            child: IconTheme(
              data: IconThemeData(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: bottomNavigation(),
            ),
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GuruScanPage();
                  },
                ),
              );
            },
            backgroundColor: primary,
            child: Icon(Icons.qr_code_scanner_rounded),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            children: [
              content(currentIndex),
            ],
          ),
        );
      },
    );
  }
}
