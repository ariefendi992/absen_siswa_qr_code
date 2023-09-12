import 'dart:async';

import 'package:absen_siswa_qr_code/cubit/user/guru/user_guru_cubit.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/drop_down_textform_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuruUpdateProfilePage extends StatefulWidget {
  final UserGuruModel userGuru;
  const GuruUpdateProfilePage({
    super.key,
    required this.userGuru,
  });

  @override
  State<GuruUpdateProfilePage> createState() => _GuruUpdateProfilePageState();
}

class _GuruUpdateProfilePageState extends State<GuruUpdateProfilePage> {
  List<String> genderList = ['Laki-Laki', 'Perempuan'];
  List<String> agamaList = [
    "Islam",
    "Kristen",
    "Khatolik",
    "Hindu",
    "Budha",
    "Konghucu"
  ];
  String? selectedGenderValue;
  String? selectedAgamaValue;
  bool showSnackBar = true;
  final TextEditingController nipController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  bool shouldPop = true;
  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setTextController();
  }

  @override
  void dispose() {
    super.dispose();
    nipController.dispose();
    fullnameController.dispose();
    alamatController.dispose();
    telpController.dispose();
  }

  void setTextController() {
    nipController.text = '${widget.userGuru.nip}';
    fullnameController.text =
        '${widget.userGuru.firstName} ${widget.userGuru.lastName}';
    alamatController.text = widget.userGuru.alamat.toString();
    telpController.text = widget.userGuru.telp.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Edit Profil',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          backgroundColor: kWhiteColor,
          foregroundColor: secondary,
          elevation: 0.2,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  // context.read<PageCubit>().setPage(1);
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/mainGuru', (route) => false);
                  setState(() {
                    showSnackBar = !showSnackBar;
                  });
                  Navigator.pop(context);
                  context.read<UserGuruCubit>().currenUserGuru();
                },
              );
            },
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            showSnackBar = !showSnackBar;
          });
          context.read<UserGuruCubit>().currenUserGuru();
          return shouldPop;
        },
        child: BlocConsumer<UserGuruCubit, UserGuruState>(
          listener: (context, state) {
            if (state is UserGuruSuccess) {
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

              // Timer(Duration(seconds: 5), () {
              //   Navigator.of(context).pop();
              //   context.read<UserGuruCubit>().currenUserGuru();
              // });
            } else if (state is UserGuruFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${state.error}',
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
                ),
              );
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 18),
                  Column(
                    children: [
                      TextFormWidget(
                        controller: nipController,
                        readOnly: true,
                        label: 'NIP',
                        borderColor: secondarySoft.withAlpha(225),
                        hintText: 'Nomor induk pegawai',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: secondarySoft,
                        ),
                      ),
                      TextFormWidget(
                        controller: fullnameController,
                        margin: EdgeInsets.only(top: 16),
                        label: 'Nama Lengkap',
                        borderColor: secondarySoft.withAlpha(225),
                        hintText: 'Nama lengkap, sertakan gelar jika ada.',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: secondarySoft,
                        ),
                      ),
                      DropDownTextFormWidget(
                        value: widget.userGuru.gender == null
                            ? selectedGenderValue
                            : widget.userGuru.gender,
                        margin: EdgeInsets.only(top: 16),
                        label: 'Gender',
                        hint: Text(
                          '- Pilih Gender -',
                          style: TextStyle(color: secondarySoft),
                        ),
                        items: genderList
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChange: (val) {
                          setState(() {
                            selectedGenderValue = val as String;
                          });
                        },
                      ),
                      DropDownTextFormWidget(
                        value: widget.userGuru.agama ?? selectedAgamaValue,
                        label: 'Agama',
                        margin: EdgeInsets.only(top: 16),
                        hint: Text(
                          '- Pilih Agama',
                          style: TextStyle(color: secondarySoft),
                        ),
                        items: agamaList
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChange: (val) {
                          setState(() {
                            selectedAgamaValue = val as String;
                          });
                        },
                      ),
                      TextFormWidget(
                        controller: alamatController,
                        label: 'Alamat',
                        margin: EdgeInsets.only(top: 16),
                        hintText: 'Alamat',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: secondarySoft,
                        ),
                      ),
                      TextFormWidget(
                        controller: telpController,
                        label: 'Telp/No.HP',
                        hintText: 'No Telp. / HP',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: secondarySoft,
                        ),
                        margin: EdgeInsets.only(top: 16, bottom: 24),
                        textInputType: TextInputType.number,
                      ),
                      ButtonWidget(
                        title: 'Simpan',
                        height: 48,
                        width: MediaQuery.of(context).size.width / 1.2,
                        colors: primary,
                        onTap: () {
                          Map<String, dynamic> data = {
                            "nip": nipController.text,
                            "fullname": fullnameController.text,
                            "gender": selectedGenderValue,
                            "agama": selectedAgamaValue,
                            "alamat": alamatController.text,
                            "telp": telpController.text,
                          };

                          setState(() {
                            Timer(Duration(seconds: 2), () {
                              context
                                  .read<UserGuruCubit>()
                                  .updateUserGuru(data: data);
                              showSnackBar;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
