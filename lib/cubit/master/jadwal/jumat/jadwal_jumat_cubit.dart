import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_jumat_state.dart';

class JadwalJumatCubit extends Cubit<JadwalJumatState> {
  JadwalJumatCubit() : super(JadwalJumatInitial());

  void getJadwalMengajarJumat() async {
    try {
      emit(JadwalJumatLoading());
      final jadwal = await ApiUserGuru().getJadwalMengajarByJumat();
      emit(JadwalJumatSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalJumatFailure('${e.response?.data["msg"]}'));
    }
  }
}
