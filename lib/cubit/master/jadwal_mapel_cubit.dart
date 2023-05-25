import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:absen_siswa_qr_code/services/http/master_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jadwal_mapel_state.dart';

class JadwalMapelCubit extends Cubit<JadwalMapelState> {
  JadwalMapelCubit() : super(JadwalMapelInitial());

  Future<void> getMapelByKelasId({required String id}) async {
    try {
      emit(JadwalMapelLoading());

      List<MapelSiswaModel> mapels =
          await MasterService().getMapelByKelasId(id: id);
      emit(JadwalMapelSuccess(mapels: mapels));
    } catch (e) {
      emit(JadwalMapelFailed(e.toString()));
    }
  }

  Future<void> getJadwalMengajarHarian() async {
    // * JADWAL MENGAJAR GURU MATA PELAJARAN

    try {
      emit(JadwalMapelLoading());

      final jadwal = await ApiUserGuru().getJadwalMengajarHarian();
      emit(JadwalMapelSuccess(jadwal: jadwal));
    } on DioError catch (e) {
      emit(JadwalMapelFailed(e.response?.data['msg']));
    }
  }

  Future<void> getJadwalMengajarByHari({required String hari}) async {
    try {
      emit(JadwalMapelLoading());

      final jadwal = await ApiUserGuru().getJadwalMengajarByHari(hari: hari);

      emit(JadwalMapelSuccess(jadwal: jadwal));
    } on DioError catch (e) {
      emit(JadwalMapelFailed(e.response?.data['msg']));
    }
  }
}
