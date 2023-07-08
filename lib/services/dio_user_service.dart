import 'dart:async';
import 'package:absen_siswa_qr_code/models/absensi_siswa_model.dart';
import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:dio/dio.dart';

/// * API USER SISWA
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

  Future<Map<String, List<RiwayatAbsenSiswa>>> fetchRiwayatAbsenSiswa() async {
    final response = await dio.get('/student/riwayat-absen');
    final body = response.data;

    if (response.statusCode == 200) {
      Map<String, List<RiwayatAbsenSiswa>> riwayatAbsen = Map.from(
        body.map(
          (key, value) => MapEntry<String, List<RiwayatAbsenSiswa>>(
            key,
            List<RiwayatAbsenSiswa>.from(
              value.map(
                (e) => RiwayatAbsenSiswa.fromJson(e),
              ),
            ),
          ),
        ),
      );

      return riwayatAbsen;
    } else {
      throw Exception('${body['msg']}');
    }
  }
}

// *
/// * API GURU
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

  Future<UserGuruModel> checkPasswordGuru({Map<String, dynamic>? data}) async {
    final response = await dio.get('/guru/check-password', data: data);
    final body = response.data;

    if (response.statusCode == 200) {
      UserGuruModel userGuru = UserGuruModel.fromJson(body);

      return userGuru;
    } else {
      throw Exception('${body["msg"]}');
    }
  }

  Future<UserGuruModel> updatePasswordGuru({Map<String, dynamic>? data}) async {
    final response = await dio.put('/guru/update-password', data: data);
    final body = response.data;

    if (response.statusCode == 200) {
      UserGuruModel userGuru = UserGuruModel.fromJson(body);
      return userGuru;
    } else {
      throw Exception('${body["msg"]}');
    }
  }

  Future<UserGuruModel> updateProfilGuru({Map<String, dynamic>? data}) async {
    final response = await dio.put('/guru/single-guru', data: data);

    final body = response.data;

    if (response.statusCode == 200) {
      UserGuruModel userGuru = UserGuruModel.fromJson(body);
      return userGuru;
    } else {
      throw Exception("${body['msg']}");
    }
  }

  Future<ScanSiswaModel> getSiswaByUsername({required String username}) async {
    final response = await dio.get('/guru/single-siswa?nisn=$username');

    final body = response.data;

    // print('PRINT FROM DIO USER SERVICE BY NISN ==>> $body');

    await storage.setStorage('today', body['today']);

    if (response.statusCode == 200) {
      ScanSiswaModel userSiswa = ScanSiswaModel.fromJson(body);

      return userSiswa;
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

  ///* GET DAFTAR SISWA KELAS AJAR DENGA NAMA WALI KELAS
  Future<List<DaftarKelasAjarModel>> getDaftarKelasAjar() async {
    final response = await dio.get('/guru/daftar-kelas-ajar');

    final body = response.data;
    // print(body);

    if (response.statusCode == 200) {
      final daftarKelas = List.from(body['data'])
          .map((e) => DaftarKelasAjarModel.fromJson(e))
          .toList();

      return daftarKelas;
    } else {
      throw Exception('${body["msg"]}');
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

  ///* GET DAFTAR SISWA
  Future<List<DaftarSiswaModel>> getDaftarSiswa(kelasId) async {
    final response = await dio.get('/guru/siswa-kelas?kelas_id=$kelasId');

    final body = response.data;
    // print(body['data']['siswa']);

    if (response.statusCode == 200) {
      final daftarSiswa = List<DaftarSiswaModel>.from(
        body['data']['siswa'].map(
          (json) => DaftarSiswaModel.fromJson(json),
        ),
      );
      return daftarSiswa;
    } else {
      throw Exception('$body["msg"], status code : ${response.statusCode}');
    }
  }

  Future<AbsenSiswaModel> absenSiswaGuruMapel(
      {mengajarID, siswaID, keterangan}) async {
    Map<String, dynamic> data = {
      'mengajar_id': mengajarID,
      'siswa_id': siswaID,
      'keterangan': keterangan
    };

    final response = await dio.post('/guru/absen-siswa', data: data);

    final body = response.data;

    if (response.statusCode == 201) {
      AbsenSiswaModel absen = AbsenSiswaModel.fromJson(body);

      return absen;
    } else {
      throw Exception(
          'msg ==> $body["msg"].\n status code ==> ${response.statusCode}');
    }
  }

  Future<Map<String, List<RAbsensiModel>>> fetchRiwayat() async {
    final response = await dio.get('/guru/daftar-riwayat');
    final body = response.data;

    if (response.statusCode == 200) {
      Map<String, List<RAbsensiModel>> mapData = Map.from(body.map(
          (key, value) => MapEntry<String, List<RAbsensiModel>>(
              key,
              List<RAbsensiModel>.from(
                  value.map((e) => RAbsensiModel.fromJson(e))))));
      // Map<String, dynamic> data = {};
      // for (var entry in mapData.entries) {
      //   String key = entry.key;
      //   List<RAbsensiModel> models = entry.value;

      //   data['tgl'] = key;

      //   print(key);
      //   data['data'] = models;

      //   for (var model in models) {
      //     print(model.namaSiswa);
      //   }
      // }

      // print('DATA===>> [$data]');
      return mapData;
    } else {
      throw Exception('${response.data["msg"]}');
    }
  }
}
