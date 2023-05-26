import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_sepekan_state.dart';

class JadwalSepekanCubit extends Cubit<JadwalSepekanState> {
  JadwalSepekanCubit() : super(JadwalSepekanInitial());

  void getJadwalSepekan({required String query}) async {
    try {
      emit(JadwalSepekanLoading());
      final jadwal = await ApiUserGuru().getJadwalMengajarSepekan(query);

      emit(JadwalSepekanSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalSepekanFailure(e.response?.data['msg']));
    }
  }

  void getJadwalSelasa({required String query}) async {
    try {
      emit(JadwalSepekanLoading());
      final jadwal = await ApiUserGuru().getJadwalMengajarSepekan(query);

      emit(JadwalSepekanSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalSepekanFailure(e.response?.data['msg']));
    }
  }
}
