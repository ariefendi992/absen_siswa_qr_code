import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_rabu_state.dart';

class JadwalRabuCubit extends Cubit<JadwalRabuState> {
  JadwalRabuCubit() : super(JadwalRabuInitial());

  void getJadwalMengajarRabu() async {
    try {
      emit(JadwalRabuLoading());
      final jadwal = await ApiUserGuru().getJadwalMengajarByRabu();

      emit(JadwalRabuSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalRabuFail(e.response?.data['msg']));
    }
  }
}
