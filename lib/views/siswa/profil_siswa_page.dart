import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilSiswaPage extends StatelessWidget {
  const ProfilSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profil Page',
              style: TextStyle(fontSize: 32),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kErrorColor,
                      content: Text(
                        state.error,
                        style: TextStyle(
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                } else if (state is AuthInitial) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/auth', (route) => false);
                }
              },
              builder: (context, state) {
                return ButtonWidget(
                  title: 'Keluar',
                  onTap: () {
                    context.read<AuthCubit>().logOut();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
