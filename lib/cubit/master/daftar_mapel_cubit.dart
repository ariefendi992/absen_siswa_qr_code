import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_master_service.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daftar_mapel_state.dart';

class DaftarMapelCubit extends Cubit<DaftarMapelState> {
  DaftarMapelCubit() : super(DaftarMapelInitial());

  Future<void> getJadwalMengajarHarian() async {
    // * JADWAL MENGAJAR GURU MATA PELAJARAN

    try {
      emit(DaftarMapelLoading());

      final jadwal = await ApiUserGuru().getJadwalMengajarHarian();
      emit(DaftarMengajarHarianSuccess(jadwal: jadwal));
    } on DioError catch (e) {
      emit(DaftarMengajarHarianFailed('${e.response?.data['msg']}'));
    }
  }

  void fetchDaftarMapelSiswa() async {
    try {
      emit(DaftarMapelLoading());

      final mapels = await MasterAPI().fetchDaftarMapelSiswa();
      emit(DaftarMapelSiswaSuccess(mapels: mapels));
    } on DioError catch (e) {
      emit(DaftarMapelSiswaFailed('${e.response?.data["msg"]}'));
    }
  }
}
