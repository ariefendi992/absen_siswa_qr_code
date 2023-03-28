import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
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
  @override
  Widget build(BuildContext context) {
    // NOTE : HEADER
    Widget header(UserSiswaModel user) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
        height: MediaQuery.of(context).size.height / 4.5,
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
                    fontSize: 24,
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
                      fontSize: 24,
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
    Widget content() {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori Menu',
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
                content(),
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
