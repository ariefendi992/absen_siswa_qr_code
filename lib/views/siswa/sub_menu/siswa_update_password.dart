import 'dart:async';

import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiswaUpdatePassPage extends StatefulWidget {
  const SiswaUpdatePassPage({super.key});

  @override
  State<SiswaUpdatePassPage> createState() => _SiswaUpdatePassPageState();
}

class _SiswaUpdatePassPageState extends State<SiswaUpdatePassPage> {
  final passwordController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmNewPassController = TextEditingController();

  bool _isVisible = true;
  bool _isVisibleNewPass = true;
  bool _isVisibleConfNewPass = true;
  bool _isCheckPass = false;
  bool _isTruePass = false;
  bool _isEnabledNewPass = false;
  bool _isCheckNewPass = false;
  bool _isCheckNewPassError = false;
  bool _isButtonWidgetEnable = false;
  bool showSnackBar = true;

  String? oldPass;
  String? newPass;
  String? msgNewValidPAss;

  @override
  void initState() {
    super.initState();
  }

  void onPasswordCheck(String password) {
    setState(() {
      _isCheckPass = false;
      _isEnabledNewPass = false;
      if (password.length >= 8) {
        _isCheckPass = true;
        Map<String, dynamic> data = {'password': password};
        context.read<UserSiswaCubit>().checkPassSiswa(data: data);
      }
      oldPass = "";
    });
  }

  void onConfNewPassCheck(String password) {
    _isCheckNewPass = false;
    _isCheckNewPassError = false;
    _isButtonWidgetEnable = false;
    msgNewValidPAss = null;
    setState(() {
      if (password.length >= 8) {
        if (password == newPass) {
          _isCheckNewPass = !_isCheckNewPass;
          _isCheckNewPassError = !_isCheckNewPassError;
          _isButtonWidgetEnable = !_isButtonWidgetEnable;
          msgNewValidPAss = "Kata sandi sesuai";
        } else {
          _isCheckNewPassError = false;
          msgNewValidPAss = "Kata sandi baru tidak sesuai";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: secondary,
          elevation: 0.2,
          title: Text(
            'Ubah KataSandi',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            },
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          context.read<UserSiswaCubit>().getCurrentUser();
          return true;
        },
        child: BlocConsumer<UserSiswaCubit, UserSiswaState>(
          listener: (context, state) {
            if (state is UserSiswaSuccess) {
              setState(() {
                oldPass = state.userSiswa.additionalData!["msg"].toString();
                _isTruePass = true;
                _isEnabledNewPass = true;
              });
            } else if (state is UserSiswaFailed) {
              setState(() {
                oldPass = state.error.toString();
                _isTruePass = false;
                _isEnabledNewPass = false;
              });
            }
            if (state is UserSiswaUpdatePassSuccess) {
              showSnackBar
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Data berhasil diperbaharui.',
                          style: TextStyle(
                            color: secondary,
                          ),
                        ),
                        backgroundColor: successExtraSoft,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          disabledTextColor: Colors.white,
                          textColor: secondary,
                          onPressed: () {
                            //Do whatever you want
                          },
                        ),
                      ),
                    )
                  : null;

              Timer(Duration(seconds: 4), () {
                setState(() {
                  showSnackBar = !showSnackBar;
                });
                Navigator.pop(context);
                context.read<UserSiswaCubit>().getCurrentUser();
              });
            }
          },
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24),
                  height: 44,
                  padding: EdgeInsets.only(right: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: kGreyBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    autofocus: true,
                    obscureText: _isVisible,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Kata sandi lama',
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
                                  _isVisible = !_isVisible;
                                });
                              },
                              child: Icon(_isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )
                          // ignore: dead_code
                          : null,
                    ),
                    onChanged: (password) => onPasswordCheck(password),
                  ),
                ),
                SizedBox(height: 8),
                _isCheckPass
                    ? Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            margin: EdgeInsets.only(left: 14),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: _isCheckPass
                                  ? _isTruePass
                                      ? successPrimary
                                      : errorSoft
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: _isCheckPass
                                    ? _isTruePass
                                        ? successSoft
                                        : errorSoft
                                    : Colors.transparent,
                              ),
                            ),
                            child: Center(
                              child: _isTruePass
                                  ? Icon(
                                      Icons.check,
                                      color: kWhiteColor,
                                      size: 15,
                                    )
                                  : Icon(
                                      Icons.close,
                                      color: kWhiteColor,
                                      size: 15,
                                    ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${oldPass ?? ""}',
                            style: TextStyle(
                                color: _isTruePass ? secondary : errorSoft),
                          )
                        ],
                      )
                    : SizedBox(),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  height: 44,
                  padding: EdgeInsets.only(right: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: kGreyBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    enabled: _isEnabledNewPass,
                    obscureText: _isVisibleNewPass,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Kata sandi baru',
                      hintStyle: TextStyle(
                          fontWeight: medium,
                          color: kGreyTextColor,
                          fontSize: 14),
                      prefixIcon: Icon(Icons.lock_clock_rounded),
                      suffixIcon: true
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  _isVisibleNewPass = !_isVisibleNewPass;
                                });
                              },
                              child: Icon(_isVisibleNewPass
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )
                          // ignore: dead_code
                          : null,
                    ),
                    onChanged: (password) {
                      setState(() {
                        newPass = password;
                      });
                    },
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      height: 44,
                      padding: EdgeInsets.only(right: 12),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: kGreyBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                          enabled: _isEnabledNewPass,
                          obscureText: _isVisibleConfNewPass,
                          controller: confirmNewPassController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Konfirmasi kata sandi baru',
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
                                        _isVisibleConfNewPass =
                                            !_isVisibleConfNewPass;
                                      });
                                    },
                                    child: Icon(_isVisibleConfNewPass
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )
                                // ignore: dead_code
                                : null,
                          ),
                          onChanged: (password) {
                            return onConfNewPassCheck(password);
                          }),
                    ),
                    SizedBox(height: 8),
                    _isCheckNewPass
                        ? Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 700),
                                margin: EdgeInsets.only(left: 14),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _isCheckNewPass
                                      ? successPrimary
                                      : Colors.transparent,
                                  // : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: _isCheckNewPass
                                          ? successPrimary
                                          : Colors.transparent,
                                      width: 1),
                                ),
                                child: Center(
                                  child: Icon(
                                      _isCheckNewPass
                                          ? Icons.check
                                          : Icons.close,
                                      color: _isCheckNewPass
                                          ? kWhiteColor
                                          : errorPrimary,
                                      size: 15),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${msgNewValidPAss ?? ""}',
                                style: TextStyle(
                                  color:
                                      _isCheckNewPass ? secondary : errorSoft,
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  elevation: _isButtonWidgetEnable ? 5 : 0,
                  title: 'Simpan',
                  height: 48,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  colors: _isButtonWidgetEnable ? primary : secondaryExtraSoft,
                  onTap: _isButtonWidgetEnable
                      ? () {
                          Map<String, dynamic> data = {
                            'password': newPass,
                          };

                          context
                              .read<UserSiswaCubit>()
                              .updatePassSiswa(data: data);
                        }
                      : null,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
