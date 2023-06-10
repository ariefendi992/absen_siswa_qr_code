import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/dio_master_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_pelanggaran_state.dart';

class DataPelanggaranCubit extends Cubit<DataPelanggaranState> {
  DataPelanggaranCubit() : super(DataPelanggaranInitial());

  void fetchDataPelanggaran() async {
    try {
      emit(DataPelanggaranLoading());
      List<DaftarPelanggarModel> dataPelanggar =
          await MasterAPI().fetchDataPelanggar();
      emit(DataPelanggaranSuccess(dataPelanggar));
    } on DioError catch (e) {
      emit(DataPelanggaranFailure('${e.response?.data["msg"]}'));
    }
  }
}
