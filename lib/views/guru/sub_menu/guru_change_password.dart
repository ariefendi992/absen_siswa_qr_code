import 'dart:async';

import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuruChangePassPage extends StatefulWidget {
  const GuruChangePassPage({super.key});

  @override
  State<GuruChangePassPage> createState() => _GuruChangePassPageState();
}

class _GuruChangePassPageState extends State<GuruChangePassPage> {
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  bool _isVisible = true;
  bool _isVisibleNewPass = true;
  bool _isVisibleConfNewPass = true;
  bool _isCheckPassword = false;
  bool _isTruePassword = false;
  bool _isEnabledNewPassword = false;
  bool _isCheckNewPassword = false;
  bool _isCheckNewPasswordError = false;
  bool _isButtonWidgetEnable = false;
  // bool _isCheckCaracterNewPassword = false;
  bool showSnackBar = true;
  String? oldPassword;
  String? newPassword;
  String? msgNewValidPass;

  @override
  void initState() {
    super.initState();
  }

  onPasswordCheck(String password) {
    setState(() {
      _isCheckPassword = false;
      _isEnabledNewPassword = false;
      if (password.length >= 8) {
        _isCheckPassword = true;
        Map<String, dynamic> data = {'password': password};
        context.read<UserGuruCubit>().checkPassGuru(data: data);
      }
      oldPassword = "";
    });
  }

  // onNewPasswordCheck(String password) {
  //   _isCheckCaracterNewPassword = false;
  //   setState(() {
  //     if (password.length )
  //   });
  // }

  onConfNewPassCheck(String password) {
    _isCheckNewPassword = false;
    _isCheckNewPasswordError = false;
    _isButtonWidgetEnable = false;
    msgNewValidPass = null;
    setState(() {
      if (password.length >= 8) {
        if (password == newPassword) {
          _isCheckNewPassword = !_isCheckNewPassword;
          _isCheckNewPasswordError = !_isCheckNewPasswordError;
          _isButtonWidgetEnable = !_isButtonWidgetEnable;
          msgNewValidPass = "Kata sandi sesuai";
        } else {
          _isCheckNewPasswordError = false;
          msgNewValidPass = "Kata sandi baru tidak sesuai.";
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
                  context.read<UserGuruCubit>().currenUserGuru();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            },
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          context.read<UserGuruCubit>().currenUserGuru();
          return true;
        },
        child: BlocConsumer<UserGuruCubit, UserGuruState>(
          listener: (context, state) {
            if (state is UserGuruSuccess) {
              setState(() {
                oldPassword = state.userGuru.additionalData!["msg"].toString();
                _isTruePassword = true;
                _isEnabledNewPassword = true;
              });
            } else if (state is UserGuruFailed) {
              setState(() {
                oldPassword = state.error.toString();
                _isTruePassword = false;
                _isEnabledNewPassword = false;
                // _isCheckPassword = false;
              });
            }
            if (state is UserGuruUpdatePassSuccess) {
              // setState(() {
              //   oldPassword = null;
              //   _isTruePassword = false;
              //   _isEnabledNewPassword = false;
              // });

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
                context.read<UserGuruCubit>().currenUserGuru();
              });
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                _isCheckPassword
                    ? Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            margin: EdgeInsets.only(left: 14),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: _isCheckPassword
                                  ? _isTruePassword
                                      ? successPrimary
                                      : errorSoft
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: _isCheckPassword
                                      ? _isTruePassword
                                          ? successSoft
                                          : errorSoft
                                      : Colors.transparent,
                                  width: 1),
                            ),
                            child: Center(
                              child: _isTruePassword
                                  ? Icon(Icons.check,
                                      color: kWhiteColor, size: 15)
                                  : Icon(Icons.close,
                                      color: kWhiteColor, size: 15),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${oldPassword ?? ""}',
                            style: TextStyle(
                              color: _isTruePassword ? secondary : errorSoft,
                            ),
                          ),
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
                    enabled: _isEnabledNewPassword,
                    obscureText: _isVisibleNewPass,
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Kata sandi baru',
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
                        newPassword = password;
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
                          enabled: _isEnabledNewPassword,
                          obscureText: _isVisibleConfNewPass,
                          controller: confirmNewPasswordController,
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
                    _isCheckNewPassword
                        ? Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 700),
                                margin: EdgeInsets.only(left: 14),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _isCheckNewPassword
                                      ? successPrimary
                                      : Colors.transparent,
                                  // : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: _isCheckNewPassword
                                          ? successPrimary
                                          : Colors.transparent,
                                      width: 1),
                                ),
                                child: Center(
                                  child: Icon(
                                      _isCheckNewPassword
                                          ? Icons.check
                                          : Icons.close,
                                      color: _isCheckNewPasswordError
                                          ? kWhiteColor
                                          : errorPrimary,
                                      size: 15),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${msgNewValidPass ?? ""}',
                                style: TextStyle(
                                  color: _isCheckNewPassword
                                      ? secondary
                                      : errorSoft,
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
                            'password': newPassword,
                          };

                          context
                              .read<UserGuruCubit>()
                              .updatePassGuru(data: data);
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
