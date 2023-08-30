import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scan_siswa_state.dart';

class ScanSiswaCubit extends Cubit<ScanSiswaState> {
  ScanSiswaCubit() : super(ScanSiswaInitial());

  void getSiswaByUsername({required String username}) async {
    try {
      emit(ScanSiswaLoading());
      ScanSiswaModel userSiswa =
          await ApiUserGuru().getSiswaByUsername(username: username);
      emit(ScanSiswaSuccess(siswaData: userSiswa));
    } on DioError catch (e) {
      emit(ScanSiswaFailure('${e.response?.data["msg"].toString()}'));
    }
  }
}
