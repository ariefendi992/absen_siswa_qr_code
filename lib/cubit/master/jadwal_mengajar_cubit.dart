import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_mengajar_state.dart';

class JadwalMengajarCubit extends Cubit<JadwalMengajarState> {
  JadwalMengajarCubit() : super(JadwalMengajarInitial());

  void getJadwalMengajarByHari(String hari) async {
    try {
      emit(JadwalMengajarLoading());

      final senin = await ApiUserGuru().getJadwalMengajarByHari(hari);

      emit(JadwalMengajarSuccess(senin));
    } on DioError catch (e) {
      emit(JadwalMengajarFailed(e.response?.data['msg']));
    }
  }
}
