// import 'dart:io';
import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/absen/absen_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/daftar_kelas_ajar_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/daftar_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/jadwal_siswa/jadwal_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/jumat/jadwal_jumat_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/kamis/jadwal_kamis_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/rabu/jadwal_rabu_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/selasa/jadwal_selasa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/senin/jadwal_senin_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/jadwal/sepekan/jadwal_sepekan_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/daftar_mapel_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/master/pelanggaran/data_pelanggaran_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/scan_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/auth/auth_page.dart';
import 'package:absen_siswa_qr_code/views/guru/main_guru_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/main_siswa_page.dart';
import 'package:absen_siswa_qr_code/views/splash_page.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ByteData data =
  //     await PlatformAssetBundle().load('assets/cert/certificate.crt');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => UserSiswaCubit()),
        BlocProvider(create: (context) => DaftarMapelCubit()),
        BlocProvider(
            create: (context) => JadwalSeninCubit()..getJadwalMengajarSenin()),
        BlocProvider(
            create: (context) =>
                JadwalSelasaCubit()..getJadwalMengajarSelasa()),
        BlocProvider(
            create: (context) => JadwalRabuCubit()..getJadwalMengajarRabu()),
        BlocProvider(
            create: (context) => JadwalKamisCubit()..getJadwalMengajarKamis()),
        BlocProvider(
            create: (context) => JadwalJumatCubit()..getJadwalMengajarJumat()),
        BlocProvider(create: (context) => JadwalSepekanCubit()),
        BlocProvider(create: (context) => UserGuruCubit()),
        BlocProvider(create: (context) => KelasAjarCubit()..getKelasAjar()),
        BlocProvider(create: (context) => DaftarSiswaCubit()),
        BlocProvider(create: (context) => AbsenSiswaCubit()),
        BlocProvider(create: (context) => DataPelanggaranCubit()),
        BlocProvider(create: (context) => JadwalSiswaCubit()),
        BlocProvider(
          create: (context) => ScanSiswaCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgorundScaffold,
          fontFamily: 'GoogleSans',
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/auth': (context) => const AuthPage(),
          '/mainSiswa': (context) => const MainSiswaPage(),
          // MAIN MENU GURU
          '/mainGuru': (context) => const MainGuruPage(),
        },
      ),
    );
  }
}
