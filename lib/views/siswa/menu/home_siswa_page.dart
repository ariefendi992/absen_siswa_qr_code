import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/mapel_page.dart';
import 'package:absen_siswa_qr_code/views/siswa/sub_menu/qr_siswa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/user/user_siswa_cubit.dart';

class HomeSiswaPage extends StatefulWidget {
  const HomeSiswaPage({super.key});

  @override
  State<HomeSiswaPage> createState() => _HomeSiswaPageState();
}

class _HomeSiswaPageState extends State<HomeSiswaPage> {
  List catNames = ['MataPelajaran', 'Absensi', 'Jadwal'];

  List<Icon> catIcons = [
    Icon(
      Icons.menu_book,
      color: kWhiteColor,
      size: 28,
    ),
    Icon(
      Icons.list,
      color: kWhiteColor,
      size: 28,
    ),
    Icon(
      Icons.more_time,
      color: kWhiteColor,
      size: 28,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // NOTE : HEADER
    Widget header(UserSiswaModel user) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 20),
        // height: MediaQuery.of(context).size.height / 4.5,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 42,
              decoration: BoxDecoration(
                color: kWhiteColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'UPT SPF SMPN2 MAKASSAR',
              style: TextStyle(
                  fontSize: 18,
                  color: kWhiteColor,
                  fontWeight: medium,
                  letterSpacing: 0.2),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Hai,',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: regular,
                    wordSpacing: 1,
                    color: kWhiteColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 4),
                Container(
                  child: Text(
                    user.firstName.length < 3
                        ? user.lastName.split(' ').length > 1
                            ? user.lastName.split(' ')[0] +
                                ' ' +
                                user.lastName.split(' ')[1]
                            : user.lastName
                        : user.firstName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: medium,
                      wordSpacing: 1,
                      color: kWhiteColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return QrSiswaPage();
                        }));
                      },
                      child: Icon(
                        Icons.qr_code,
                        color: kWhiteColor.withOpacity(0.8),
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'NISN : ${user.nisn}',
              style: TextStyle(
                  color: kWhiteColor.withOpacity(0.9),
                  fontWeight: regular,
                  fontSize: 14,
                  letterSpacing: 0.8),
            ),
            SizedBox(height: 2),
            Text(
              'Kelas : ${user.kelas}',
              style: TextStyle(
                  color: kWhiteColor.withOpacity(0.9),
                  fontWeight: regular,
                  fontSize: 14,
                  letterSpacing: 0.8),
            ),
          ],
        ),
      );
    }

    // NOTE: CONTENT
    Widget content(String kelasId) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 4),
            GridView.count(
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1.2,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapelPage(kelasId)),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: catColors[0],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: catIcons[0],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        catNames[0],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: catColors[1],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: catIcons[1],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        catNames[1],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: catColors[2],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: catIcons[2],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        catNames[2],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Daftar Pelanggar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<UserSiswaCubit, UserSiswaState>(
      builder: (context, state) {
        if (state is UserSiswaSuccess) {
          final user = state.userSiswa;
          return RefreshIndicator(
            onRefresh: () async {
              final id = await CustomStorage().getStorage('id');
              context.read<UserSiswaCubit>().getCurrentUser(id: id);
            },
            color: kPrimaryColor,
            child: ListView(
              children: [
                header(user),
                content(user.kelasId.toString()),
              ],
            ),
          );
        } else if (state is UserSiswaFailed) {
          return RefreshIndicator(
            onRefresh: () async {
              final id = await CustomStorage().getStorage('id');
              context.read<UserSiswaCubit>().getCurrentUser(id: id);
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Text(
                    state.error,
                    style: TextStyle(
                      fontWeight: medium,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
