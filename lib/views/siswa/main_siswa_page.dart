import 'package:absen_siswa_qr_code/cubit/master/jadwal/jadwal_siswa/jadwal_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/pelanggaran/data_pelanggaran_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/home_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/profil_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/menu/qr_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_bottom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSiswaPage extends StatefulWidget {
  const MainSiswaPage({super.key});

  @override
  State<MainSiswaPage> createState() => _MainSiswaPageState();
}

class _MainSiswaPageState extends State<MainSiswaPage> {
  String? id;

  // @override
  // void initState() {
  //   super.initState();
  //   // getUserById();
  // }

  // void getUserById() async {
  //   final id = await CustomStorage().getStorage('id');
  //   if (id != null) {
  //     // context.read<UserSiswaCubit>().getCurrentUser(id: id.toString());
  //     context.read<UserSiswaCubit>().getCurrentUser();
  //   }
  // }

  @override
  void initState() {
    context.read<DataPelanggaranCubit>().fetchDataPelanggaran();
    context.read<JadwalSiswaCubit>().fetchJadwalHarianSiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomeSiswaPage();

        case 3:
          return ProfilSiswaPage();

        default:
          return HomeSiswaPage();
      }
    }

    // Widget bottomNavigationBar() {
    //   return Container(
    //     height: 65,
    //     child: Container(
    //       alignment: Alignment.center,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           ButtonAppBarWidget(
    //             index: 0,
    //             title: 'Beranda',
    //             iconPrimary: Icons.home,
    //             iconSecondary: Icons.home_outlined,
    //           ),
    //           ButtonAppBarWidget(
    //             index: 1,
    //             title: 'Riwayat',
    //             iconPrimary: Icons.history,
    //             iconSecondary: Icons.history_outlined,
    //           ),
    //           ButtonAppBarWidget(
    //             index: 2,
    //             title: 'DaftarSiswa',
    //             iconPrimary: Icons.people,
    //             iconSecondary: Icons.people_outline,
    //           ),
    //           ButtonAppBarWidget(
    //             index: 3,
    //             title: 'Akun',
    //             iconPrimary: Icons.account_circle,
    //             iconSecondary: Icons.account_circle_outlined,
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget newBottomNavigationBar() {
      return Container(
        height: 58,
        child: Container(
          // alignment: Alignment.center,
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
                title: 'QR Code',
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
              child: newBottomNavigationBar(),
            ),
          ),
          floatingActionButton: FloatingActionButton.small(
            backgroundColor: kPrimaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QrSiswaPage();
              }));
            },
            child: Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 26,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(children: [
            content(currentIndex),
          ]),
        );
      },
    );
  }
}
