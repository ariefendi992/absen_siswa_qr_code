import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_selasa_state.dart';

class JadwalSelasaCubit extends Cubit<JadwalSelasaState> {
  JadwalSelasaCubit() : super(JadwalSelasaInitial());

  void getJadwalMengajarSelasa() async {
    try {
      emit(JadwalSelasaLoading());

      final jadwal = await ApiUserGuru().getJadwalMengajarBySelasa();

      emit(JadwalSelasaSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalSelasaFail(e.response?.data['msg']));
    }
  }
}
