import 'dart:async';

import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/button_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/drop_down_textform_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SiswaProfilPage extends StatefulWidget {
  final UserSiswaModel siswa;
  const SiswaProfilPage({super.key, required this.siswa});

  @override
  State<SiswaProfilPage> createState() => _SiswaProfilPageState();
}

class _SiswaProfilPageState extends State<SiswaProfilPage> {
  bool showSnackBar = true;
  bool shouldPop = true;
  String? selectedGenderValue;
  String? selectedAgamaValue;

  List<String> genderList = ['Laki-Laki', 'Perempuan'];
  List<String> agamaList = [
    "Islam",
    "Kristen",
    "Khatolik",
    "Hindu",
    "Budha",
    "Konghucu"
  ];

  final TextEditingController nisController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController ortuController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setTextController();
  }

  @override
  void dispose() {
    super.dispose();
    nisController.dispose();
    nameController.dispose();
    tempatLahirController.dispose();
    tglLahirController.dispose();
    alamatController.dispose();
    telpController.dispose();
    ortuController.dispose();
  }

  void setTextController() {
    nisController.text = '${widget.siswa.nisn}';
    nameController.text = '${widget.siswa.firstName} ${widget.siswa.lastName}';
    tempatLahirController.text = '${widget.siswa.tempatLahir}';
    tglLahirController.text = widget.siswa.additionalData?["tgl_lahir"] != null
        ? '${widget.siswa.additionalData!["tgl_lahir"]}'
        : "";
    alamatController.text = widget.siswa.additionalData?["alamat"] == null
        ? ''
        : "${widget.siswa.additionalData?['alamat']}";
    telpController.text = widget.siswa.additionalData?['telp'] == null
        ? ''
        : "${widget.siswa.additionalData?['telp']}";
    ortuController.text = widget.siswa.additionalData?["nama_ortu"] == null
        ? ""
        : "${widget.siswa.additionalData?['nama_ortu']}";
  }

  @override
  Widget build(BuildContext context) {
    Widget textField() {
      return Column(
        children: [
          TextFormWidget(
            label: 'NISN',
            controller: nisController,
            readOnly: true,
          ),
          TextFormWidget(
            label: 'Nama Lengkap',
            controller: nameController,
            margin: EdgeInsets.only(top: 16),
          ),
          DropDownTextFormWidget(
            margin: EdgeInsets.only(top: 16),
            label: 'Gender',
            hint: Text(
              '- Pilih Gender -',
              style: TextStyle(color: secondarySoft),
            ),
            items: genderList
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e.toString(),
                  ),
                )
                .toList(),
            value: widget.siswa.gender == null
                ? selectedGenderValue
                : widget.siswa.gender,
            onChange: (val) {
              setState(() {
                selectedGenderValue = '$val';
              });
            },
          ),
          TextFormWidget(
            label: 'Tempat Lahir',
            margin: EdgeInsets.only(top: 16),
            controller: tempatLahirController,
          ),
          TextFormWidget(
            label: 'Tgl Lahir',
            hintText: 'Pilih Tanggal',

            margin: EdgeInsets.only(top: 16),
            controller: tglLahirController,
            // textInputType: TextInputType.none,
            readOnly: true,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: allColor[7],
              ),
              onPressed: () async {
                DateTime? datePicker = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (datePicker != null) {
                  setState(() {
                    tglLahirController.text =
                        DateFormat('yyyy-MM-dd').format(datePicker);
                  });
                }
              },
            ),
            // onTap: () async {
            //   DateTime? datePicker = await showDatePicker(
            //     context: context,
            //     initialDate: DateTime.now(),
            //     firstDate: DateTime(2000),
            //     lastDate: DateTime(2101),
            //   );

            //   if (datePicker != null) {
            //     setState(() {
            //       tglLahirController.text =
            //           DateFormat('yyyy-MM-dd').format(datePicker);
            //     });
            //   }
            // },
          ),
          DropDownTextFormWidget(
            label: 'Agama',
            margin: EdgeInsets.only(top: 16),
            hint: Text('Pilih Agama'),
            items: agamaList.map((e) {
              return DropdownMenuItem(
                value: e.toString(),
                child: Text(e.toString()),
              );
            }).toList(),
            value: widget.siswa.additionalData?["agama"] == null
                ? selectedAgamaValue
                : widget.siswa.additionalData?['agama'],
            onChange: (val) {
              setState(() {
                selectedAgamaValue = val.toString();
              });
            },
          ),
          TextFormWidget(
            label: 'Alamat',
            margin: EdgeInsets.only(top: 16),
            controller: alamatController,
          ),
          TextFormWidget(
            label: 'Telp.',
            margin: EdgeInsets.only(top: 16),
            controller: telpController,
            textInputType: TextInputType.number,
          ),
          TextFormWidget(
            label: 'Nama Orang Tua.',
            margin: EdgeInsets.only(top: 16),
            controller: ortuController,
          )
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: allColor[7],
          elevation: 0.2,
          title: Text(
            'Perbaharui Data',
            style: TextStyle(
              color: allColor[7],
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: ((context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              );
            }),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            showSnackBar = !showSnackBar;
          });
          context.read<UserSiswaCubit>().getCurrentUser();
          return shouldPop;
        },
        child: BlocConsumer<UserSiswaCubit, UserSiswaState>(
          listener: (context, state) {
            if (state is UserSiswaSuccess) {
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
            } else if (state is UserSiswaFailed) {
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
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                children: [
                  textField(),
                  ButtonWidget(
                    title: 'Simpan',
                    margin: EdgeInsets.only(top: 30, bottom: 40),
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    colors: primary,
                    borderRadiusCircular: 18,
                    onTap: () {
                      Map<String, dynamic> data = {
                        "nisn": nisController.text,
                        "fullname": nameController.text,
                        'gender': selectedGenderValue == null
                            ? widget.siswa.gender
                            : selectedGenderValue,
                        'tempat': tempatLahirController.text,
                        'tgl': tglLahirController.text,
                        'agama': selectedAgamaValue == null
                            ? widget.siswa.additionalData!['agama']
                            : selectedAgamaValue,
                        'alamat': alamatController.text,
                        'telp': telpController.text,
                        'nama_ortu': ortuController.text,
                        'kelas': widget.siswa.kelasId,
                      };

                      setState(() {
                        Timer(Duration(seconds: 2), () {
                          context
                              .read<UserSiswaCubit>()
                              .updateSiswaProfil(data);
                          showSnackBar;
                        });
                      });
                    },
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
