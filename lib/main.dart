import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/siswa_mapel_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/auth/auth_page.dart';
import 'package:absen_siswa_qr_code/views/guru/main_guru_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/main_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/daftar_siswa.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/riwayat_absen.dart';
import 'package:absen_siswa_qr_code/views/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  // final CustomStorage storage = CustomStorage();
  // final status = await storage.getStorage('isLoggedIn');
  // print('Status ==> $status');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => UserSiswaCubit()),
        BlocProvider(create: (context) => SiswaMapelCubit()),
        BlocProvider(create: (context) => UserGuruCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgorundScaffold,
          fontFamily: 'GoogleSans',
          // fontFamily: GoogleFonts.poppins().fontFamily,
          // fontFamily: 'Poppins',
          // textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          //     bodyText2: GoogleFonts.poppins(textStyle: textTheme.bodyText2)),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/auth': (context) => const AuthPage(),
          '/mainSiswa': (context) => const MainSiswaPage(),
          '/riwayat': (context) => const RiwayatAbsensiSiswaPage(),
          '/daftarSiswa': (context) => const DaftarKelasSiswaPage(),
          // MAIN MENU GURU
          '/mainGuru': (context) => const MainGuruPage(),
        },
      ),
    );
  }
}
