import 'package:absen_siswa_qr_code/cubit/auth/auth_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  // final bool? isLogOut;
  const AuthPage({
    super.key,
    // this.isLogOut = false,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  bool isChecked = false;
  String? username;
  String? password;

  @override
  void initState() {
    super.initState();
    userPass();
    // print('IS LOGOUT ==>> ${widget.isLogOut}');
    // widget.isLogOut == true ? showSnackBar() : false;
  }

  void showSnackBar() {
    final snackBar = SnackBar(
      content: Text(
        'Log',
        style: TextStyle(
          color: secondary,
        ),
      ),
      backgroundColor: errorSoft,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: secondary,
        onPressed: () {
          //Do whatever you want
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void userPass() async {
    username = await CustomStorage().getStorage('username');
    password = await CustomStorage().getStorage('password');
    setState(() {
      if (username != null && password != null) {
        usernameController.text = username!;
        passwordController.text = password!;
        isChecked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          // reverse: true,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
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
                                Container(
                                  decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    width: 80,
                                  ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 44,
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
                                  height: 44,
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
                                      prefixIcon: Icon(Icons.lock_rounded),
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
                            SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // color: kErrorColor,
                                  width: 38,
                                  height: 38,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Ingat Saya?',
                                  style: TextStyle(
                                    fontWeight: bold,
                                    fontSize: 16,
                                    color: kBlackColor.withOpacity(0.6),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 12),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                                  if (state.userAuth.group == 'siswa') {
                                    Navigator.pushReplacementNamed(
                                        context, '/mainSiswa');
                                    context
                                        .read<UserSiswaCubit>()
                                        .getCurrentUser();
                                  } else if (state.userAuth.group == 'guru') {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/mainGuru', (route) => false);
                                    context
                                        .read<UserGuruCubit>()
                                        .currenUserGuru();
                                  }
                                } else if (state is AuthFailed) {
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
                                  fontSize: 20,
                                  title: 'Masuk',
                                  height: 44,
                                  onTap: () {
                                    if (isChecked == true) {
                                      CustomStorage().setStorage(
                                          'username', usernameController.text);
                                      CustomStorage().setStorage(
                                          'password', passwordController.text);
                                    } else if (isChecked == false) {
                                      CustomStorage().deleteKey('username');
                                      CustomStorage().deleteKey('password');
                                    }
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
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 0))
            ],
          ),
        ),
      ),
    );
  }
}
