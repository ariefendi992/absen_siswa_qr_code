import 'dart:async';

import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:dio/dio.dart';

class ApiUserSiswa {
  final Dio dio = Dio();

  CustomStorage storage = CustomStorage();

  ApiUserSiswa() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<UserSiswaModel> getCurrentSiswa() async {
    final response = await dio.get('student/single');

    final jsonResp = response.data;
    // print('dio getCurrentSiswa === ${jsonResp.toString()}');
    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(jsonResp);
      return userSiswa;
    } else {
      throw (jsonResp['msg']);
    }
  }

  Future<UserSiswaModel> getSiswaByUsername({required String username}) async {
    final response = await dio.get('/guru/single-siswa?nisn=$username');

    final body = response.data;

    // print('PRINT FROM DIO USER SERVICE BY NISN ==>> $body');

    await storage.setStorage('today', body['today']);

    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(body);

      return userSiswa;
    } else {
      throw (body['msg'].toString());
    }
  }
}

class ApiUserGuru {
  final Dio dio = Dio();

  final CustomStorage storage = CustomStorage();

  ApiUserGuru() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<UserGuruModel> getCurrentGuru() async {
    final response = await dio.get('/guru/single-guru');

    final body = response.data;
    // print('PRINT FROM APIUSER GURU SERVICE ==> [$body]');

    if (response.statusCode == 200) {
      UserGuruModel userGuru = UserGuruModel.fromJson(body);

      return userGuru;
    } else {
      throw (body['msg'].toString());
    }
  }

  Future<List<JadwalMengajarHarianModel>> getJadwalMengajarHarian() async {
    final response = await dio.get('/guru/jadwal-harian');

    final body = response.data;

    // print(body);

    if (response.statusCode == 200) {
      final jadwal = List.from(body['data']).map((e) {
        return JadwalMengajarHarianModel.fromJson(e);
      }).toList();

      return jadwal;
    } else {
      throw (body['msg'].toString());
    }
  }

  Future<List<JadwalMengajarSeninModel>> getJadwalMengajarBySenin() async {
    final response = await dio.get('/guru/jadwal-hari?hari=senin');

    final body = response.data;

    // print(body['data']);

    if (response.statusCode == 200) {
      // final jadwalSenin = List.from(body['data'])
      //     .map(
      //       (e) => JadwalMengajarHariModel.fromJson(e),
      //     )
      //     .toList();
      // return jadwalSenin;
      List<JadwalMengajarSeninModel> hari = List<JadwalMengajarSeninModel>.from(
        body['data'].map((json) {
          return JadwalMengajarSeninModel.fromJson(json);
        }),
      ).toList();

      return hari;
    } else {
      throw (body['msg'].toString());
    }
  }

  Future<List<JadwalMengajarSelasaModel>> getJadwalMengajarBySelasa() async {
    final response = await dio.get('/guru/jadwal-hari?hari=selasa');

    final body = response.data;

    if (response.statusCode == 200) {
      List<JadwalMengajarSelasaModel> hari =
          List<JadwalMengajarSelasaModel>.from(
        body['data'].map((json) {
          return JadwalMengajarSelasaModel.fromJson(json);
        }),
      ).toList();

      return hari;
    } else {
      throw (body['msg'].toString());
    }
  }

  Future<List<JadwalMengajarRabuModel>> getJadwalMengajarByRabu() async {
    final response = await dio.get('/guru/jadwal-hari?hari=rabu');

    final body = response.data;

    if (response.statusCode == 200) {
      final hari = List.from(body['data'])
          .map(
            (e) => JadwalMengajarRabuModel.fromJson(e),
          )
          .toList();

      return hari;
    } else {
      throw (body['msg'].toString());
    }
  }

  Future<List<JadwalMengajarKamisModel>> getJadwalMengajarByKamis() async {
    final response = await dio.get('/guru/jadwal-hari?hari=kamis');

    final body = response.data;

    if (response.statusCode == 200) {
      final hari = List.from(body['data'])
          .map(
            (e) => JadwalMengajarKamisModel.fromJson(e),
          )
          .toList();

      return hari;
    } else {
      throw (body['msg'].toString());
    }
  }

  Future<List<JadwalMengajarJumatModel>> getJadwalMengajarByJumat() async {
    final response = await dio.get('/guru/jadwal-hari?hari=jumat');

    final body = response.data;

    if (response.statusCode == 200) {
      final hari = List.from(body['data'])
          .map(
            (e) => JadwalMengajarJumatModel.fromJson(e),
          )
          .toList();

      return hari;
    } else {
      throw (body['msg'].toString());
    }
  }

  /// * UNTUK MENCARI DATA
  Future<List<JadwalMengajarSepekanModel>> getJadwalMengajarSepekan(
      String query) async {
    final response = await dio.get('/guru/jadwal-sepekan');

    final body = response.data;

    if (response.statusCode == 200) {
      final jadwal = List.from(body['data']).map((e) {
        return JadwalMengajarSepekanModel.fromJson(e);
      }).where((json) {
        // print(json.hari);
        final hari = json.hari!;
        final hariLower = json.hari!.toLowerCase();
        // print(hari);
        return hari.contains(query) || hariLower.contains(query);
      }).toList();

      return jadwal;
    } else {
      throw Exception();
    }
  }
}
