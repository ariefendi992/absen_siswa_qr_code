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
          (json) => DaftarPelanggarModel.fromJson(json),
        ),
      );
      return dataPelanggar;
    } else {
      throw Exception('${body["msg"]}');
    }
  }

  Future<List<JadwalPelajaranSiswaModel>> fetchJadwalHarianSiswa() async {
    final response = await dio.get('/student/jadwal-harian');
    final body = response.data;

    if (response.statusCode == 200) {
      List<JadwalPelajaranSiswaModel> jadwal =
          List<JadwalPelajaranSiswaModel>.from(body['data']
              .map((json) => JadwalPelajaranSiswaModel.fromJson(json)));
      return jadwal;
    } else {
      throw Exception('${body["msg"]}');
    }
  }

  Future<List<DaftarMapelSisaModel>> fetchDaftarMapelSiswa() async {
    final response = await dio.get('/student/daftar-mapel');
    final body = response.data;

    if (response.statusCode == 200) {
      List<DaftarMapelSisaModel> mapels = List<DaftarMapelSisaModel>.from(
          body.map((json) => DaftarMapelSisaModel.fromJson(json)));

      return mapels;
    } else {
      throw Exception('${body["msg"]}');
    }
  }

  Future<Map<String, List<JadwalPelajaranSiswaModel>>>
      fetchJadwalPelajaranSiswa() async {
    final response = await dio.get('/student/jadwal-pelajaran');
    final body = response.data;

    if (response.statusCode == 200) {
      Map<String, List<JadwalPelajaranSiswaModel>> jadwal = Map.from(
        body.map(
          (key, value) => MapEntry<String, List<JadwalPelajaranSiswaModel>>(
            key,
            List<JadwalPelajaranSiswaModel>.from(
              value.map(
                (e) => JadwalPelajaranSiswaModel.fromJson(e),
              ),
            ),
          ),
        ),
      );
      return jadwal;
    } else {
      throw Exception('${body["msg"]}');
    }
  }
}
