import 'package:absen_siswa_qr_code/cubit/user/siswa/user_siswa_cubit.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/widgets/drop_down_textform_widget.dart';
import 'package:absen_siswa_qr_code/views/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  void setTextController() {
    nisController.text = '${widget.siswa.nisn}';
    nameController.text = '${widget.siswa.firstName} ${widget.siswa.lastName}';
    tempatLahirController.text = '${widget.siswa.tempatLahir}';
    tglLahirController.text = '${widget.siswa.additionalData!["tgl_lahir"]}';
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
            margin: EdgeInsets.only(top: 16),
            controller: tglLahirController,
            onTap: () async {
              // DateTime datePicker = await showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
            },
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
