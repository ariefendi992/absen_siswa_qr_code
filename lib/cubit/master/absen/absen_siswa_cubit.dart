import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'absen_siswa_state.dart';

class AbsenSiswaCubit extends Cubit<AbsenSiswaState> {
  AbsenSiswaCubit() : super(AbsenSiswaInital());

  void absenSiswa(
      {required mengajarID, required siswaID, required keterangan}) async {
    try {
      emit(AbsenSiswaLoading());
      final absenSiswa = await ApiUserGuru().absenSiswaGuruMapel(
          mengajarID: mengajarID, siswaID: siswaID, keterangan: keterangan);
      emit(AbsenSiswaSuccess(absenSiswa));
    } on DioError catch (e) {
      emit(AbsenSiswaFailure('${e.response?.data["msg"]}'));
    }
  }

  void getRiwayatAbsen() async {
    try {
      emit(AbsenSiswaLoading());

      final riwayatAbsen = await ApiUserGuru().getRiwayat();
      emit(RiwayatAbsenStateSuccess(riwayatAbsen));
    } on DioError catch (e) {
      emit(RiwayatAbsenStateFailure('${e.response?.data["msg"]}'));
    }
  }

  void getRiwayatAbsenbyTgl({required String tglAbsen}) async {
    try {
      emit(AbsenSiswaLoading());

      final riwayatAbsen = await ApiUserGuru().getRiwayatByTgl(tglAbsen);
      emit(RiwayatAbsenStateSuccess(riwayatAbsen));
    } on DioError catch (e) {
      emit(RiwayatAbsenStateFailure('${e.response?.data["msg"]}'));
    }
  }
}
