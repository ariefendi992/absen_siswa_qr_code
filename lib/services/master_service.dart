import 'dart:convert';

import 'package:absen_siswa_qr_code/models/master_model.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:http/http.dart' as http;

class MasterService {
  Future<List<MapelSiswaModel>> getMapelByKelasId({required String id}) async {
    try {
      final url = '$baseUrl/api/v2/student/mapel-kelas/$id';
      final response = await http.get(Uri.parse(url));
      final jsonResp = jsonDecode(response.body);

      print(jsonResp);

      if (response.statusCode == 200) {
        List<MapelSiswaModel> mapels = List.from(jsonResp).map((e) {
          return MapelSiswaModel.fromJson(e);
        }).toList();
        return mapels;
      } else {
        throw Exception(
            'Gagal memuat data. url: $url. status code : ${response.statusCode}');
      }
    } catch (e) {
      throw e;
    }
  }
}
