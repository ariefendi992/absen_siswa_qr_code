import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            // physics: ClampingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.2,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(70),
                          ),
                        ),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 65,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Selamat Datang',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: kWhiteColor,
                                  fontWeight: semiBold,
                                  letterSpacing: 0.5,
                                  wordSpacing: 2,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Silahkan masuk dengan NISN atau NIP\nsebagai nama pengguna.',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: kWhiteColor.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.45,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.45,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Pengguna',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: kBlackColor.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 65,
                                  padding: EdgeInsets.only(right: 12),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: kGreyBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'NISN / NIP',
                                      hintStyle: TextStyle(
                                        fontWeight: medium,
                                        color: kGreyTextColor,
                                        fontSize: 14,
                                      ),
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kata Sandi',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: kBlackColor.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 65,
                                  padding: EdgeInsets.only(right: 12),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: kGreyBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    obscureText: passToggle,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Kata Sandi',
                                      hintStyle: TextStyle(
                                        fontWeight: medium,
                                        color: kGreyTextColor,
                                        fontSize: 14,
                                      ),
                                      prefixIcon: Icon(Icons.person),
                                      suffixIcon: true
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  passToggle = !passToggle;
                                                });
                                              },
                                              child: Icon(passToggle
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                            )
                                          // ignore: dead_code
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // FormInputWithIconWidget(
                            //   controller: usernameController,
                            //   title: 'Nama Pengguna',
                            //   hintText: 'NISN / NIP',
                            //   icons: Icons.person,
                            //   onTap: () {},
                            //   validator: (value) {
                            //     return value!;
                            //   },
                            // ),
                            // SizedBox(height: 20),
                            // FormInputWithIconWidget(
                            //   validator: (value) => value!,
                            //   passToggle: passToggle,
                            //   obsecureText: passToggle,
                            //   controller: passwordController,
                            //   title: 'Kata Sandi',
                            //   hintText: 'Kata Sandi',
                            //   icons: Icons.lock,
                            //   isSuffix: true,
                            //   onTap: () {
                            //     setState(() {
                            //       passToggle = !passToggle;
                            //     });
                            //   },
                            // ),
                            SizedBox(height: 32),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                                  // if (state.userAuth.group == 'siswa') {
                                  Navigator.pushReplacementNamed(
                                      context, '/mainSiswa');
                                  // }
                                } else if (state is AuthFailed) {
                                  print(state.error);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: kErrorColor,
                                      content: Text(
                                        state.error,
                                        style: TextStyle(fontWeight: medium),
                                      ),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return ButtonWidget(
                                  title: 'Masuk',
                                  height: 50,
                                  onTap: () {
                                    print(usernameController.text);
                                    context.read<AuthCubit>().login(
                                          username: usernameController.text,
                                          password: passwordController.text,
                                        );
                                  },
                                );
                              },
                            ),
                            // SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
