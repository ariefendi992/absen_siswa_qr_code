import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_senin_state.dart';

class JadwalSeninCubit extends Cubit<JadwalSeninState> {
  JadwalSeninCubit() : super(JadwalSeninInitial());

  void getJadwalMengajarSenin() async {
    try {
      emit(JadwalSeninLoading());

      final jadwal = await ApiUserGuru().getJadwalMengajarBySenin();

      emit(JadwalSeninSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalSeninFail(e.response?.data['msg']));
    }
  }
}
