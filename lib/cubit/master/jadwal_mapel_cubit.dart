import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/http/master_service.dart';
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
}
