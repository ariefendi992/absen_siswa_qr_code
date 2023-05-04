import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/http/master_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'siswa_mapel_state.dart';

class SiswaMapelCubit extends Cubit<SiswaMapelState> {
  SiswaMapelCubit() : super(SiswaMapelInitial());

  Future<void> getMapelByKelasId({required String id}) async {
    try {
      emit(SiswaMapelLoading());

      List<MapelSiswaModel> mapels =
          await MasterService().getMapelByKelasId(id: id);
      emit(SiswaMapelSuccess(mapels));
    } catch (e) {
      emit(SiswaMapelFailed(e.toString()));
    }
  }
}
