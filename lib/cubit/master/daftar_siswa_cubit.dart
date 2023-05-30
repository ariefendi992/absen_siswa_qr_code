import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daftar_siswa_state.dart';

class DaftarSiswaCubit extends Cubit<DaftarSiswaSate> {
  DaftarSiswaCubit() : super(DaftarSiswaInitial());

  void getDataSiswa({required kelasId}) async {
    try {
      emit(DaftarSiswaLoading());

      final daftarSiswa = await ApiUserGuru().getDaftarSiswa(kelasId);
      emit(DaftarSiswaSuccess(daftarSiswa));
    } on DioError catch (e) {
      emit(DaftarSiswaFailure('${e.response?.data["msg"]}'));
    }
  }
}
