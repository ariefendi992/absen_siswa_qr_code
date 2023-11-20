import 'package:absen_siswa_qr_code/cubit/user/guru/scan_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_get_siswa_absen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDaftarSiswaWidget extends StatelessWidget {
  final DaftarSiswaModel daftarSiswa;
  const CardDaftarSiswaWidget({super.key, required this.daftarSiswa});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 16),
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: secondarySoft),
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            height: 48,
            width: 48,
            child: daftarSiswa.foto != null
                ? Image.network(
                    '${baseUrl}/${daftarSiswa.foto}',
                    height: 48,
                    width: 48,
                    // fit: BoxFit.fitHeigh,
                  )
                : Image.asset(
                    'assets/images/reading-book.png',
                    color: allColor[4],
                  ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${daftarSiswa.firstName} ${daftarSiswa.lastName}',
                  style: TextStyle(
                    fontWeight: bold,
                    fontSize: 16,
                    color: allColor[7],
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '${daftarSiswa.kelas}',
                  style: TextStyle(
                      fontWeight: medium,
                      fontSize: 14,
                      color: allColor[7],
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<ScanSiswaCubit>()
                  .getSiswaByUsername(username: daftarSiswa.username!);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return GuruGetSiswaAbsen(
                    username: daftarSiswa.username!,
                  );
                }),
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: primary,
              size: 22,
            ),
          ),
          // Container(
          //   child: ClipOval(
          //     child: Container(
          //       alignment: Alignment.center,
          //       padding: EdgeInsets.all(6),
          //       decoration: BoxDecoration(
          //         color: secondaryExtraSoft,
          //       ),
          //       child: Icon(
          //         Icons.arrow_forward_ios_rounded,
          //         color: primary,
          //         size: 20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
