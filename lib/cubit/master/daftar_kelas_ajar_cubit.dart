import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daftar_kelas_ajar_state.dart';

class KelasAjarCubit extends Cubit<KelasAjarState> {
  KelasAjarCubit() : super(KelasAjarInitial());

  void getKelasAjar() async {
    try {
      emit(KelasAjarLoading());

      final daftarKelas = await ApiUserGuru().getDaftarKelasAjar();

      emit(KelasAjarSuccess(daftarKelas));
    } on DioError catch (e) {
      emit(KelasAjarFailure('${e.response?.data["msg"]}'));
    }
  }
}
