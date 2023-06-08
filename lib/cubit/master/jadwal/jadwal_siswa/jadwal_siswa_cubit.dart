import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_master_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jadwal_siswa_state.dart';

class JadwalSiswaCubit extends Cubit<JadwalSiswaState> {
  JadwalSiswaCubit() : super(JadwalSiswaInitial());

  void fetchJadwalHarianSiswa() async {
    try {
      emit(JadwalSiswaLoading());
      List<JadwalHarianSiswaModel> jadwal =
          await MasterAPI().fetchJadwalHarianSiswa();
      emit(JadwalHarianSiswaSuccess(jadwal));
    } on DioError catch (e) {
      emit(JadwalSiswaFailure('${e.response?.data["msg"]}'));
    }
  }
}
