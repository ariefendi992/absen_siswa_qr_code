import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/models/pelanggaran_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_pelanggaran_state.dart';

class DataPelanggaranCubit extends Cubit<DataPelanggaranState> {
  DataPelanggaranCubit() : super(DataPelanggaranInitial());


  void fetchRiwayatPelanggaranSiswa() async {
    try {
      emit(DataPelanggaranLoading());
      RiwayatPelanggaranSiswaModel pelanggaran =
          await ApiUserSiswa().fetchRiwayatPelaggaranSiswa();
      emit(RiwayatPelanggaranSiswaSuccess(pelanggaran));
    } on DioError catch (e) {
      emit(RiwayatPelanggaranSiswaFail('${e.response?.data["msg"]}'));
    }
  }
}
