import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_kamis_state.dart';

class JadwalKamisCubit extends Cubit<JadwalKamisState> {
  JadwalKamisCubit() : super(JadwalKamisInitial());

  void getJadwalMengajarKamis() async {
    try {
      emit(JadwalKamisLoading());
      final jadwal = await ApiUserGuru().getJadwalMengajarByKamis();
      emit(JadwalKamisSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalKamisFailure('${e.response?.data["msg"]}'));
    }
  }
}
