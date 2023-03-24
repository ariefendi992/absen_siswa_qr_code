import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/form_input_with_icon_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
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
                      child: Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FormInputWithIconWidget(
                                controller: usernameController,
                                title: 'Nama Pengguna',
                                hintText: 'NISN / NIP',
                                icons: Icons.person,
                                onTap: () {},
                                validator: (value) {
                                  return value!;
                                },
                              ),
                              SizedBox(height: 20),
                              FormInputWithIconWidget(
                                validator: (value) => value!,
                                passToggle: passToggle,
                                obsecureText: passToggle,
                                controller: passwordController,
                                title: 'Kata Sandi',
                                hintText: 'Kata Sandi',
                                icons: Icons.lock,
                                isSuffix: true,
                                onTap: () {
                                  setState(() {
                                    passToggle = !passToggle;
                                  });
                                },
                              ),
                              SizedBox(height: 32),
                              ButtonWidget(
                                title: 'Masuk',
                                height: 50,
                                onTap: () {
                                  Navigator.pushNamed(context, '/mainSiswa');
                                },
                              ),
                              // SizedBox(height: 40),
                            ],
                          ),
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
