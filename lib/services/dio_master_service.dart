import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:dio/dio.dart';

class MasterAPI {
  final Dio dio = Dio();
  final CustomStorage storage = CustomStorage();

  MasterAPI() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<List<DaftarPelanggarModel>> fetchDataPelanggar() async {
    final response = await dio.get('/student/daftar-pelanggar');
    final body = response.data;

    if (response.statusCode == 200) {
      List<DaftarPelanggarModel> dataPelanggar =
          List<DaftarPelanggarModel>.from(
        body['data'].map(
          (json) => DaftarKelasAjarModel.fromJson(json),
        ),
      );
      return dataPelanggar;
    } else {
      throw Exception('${body["msg"]}');
    }
  }
}
