import 'dart:convert';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:http/http.dart' as http;

class UserSiswaService {
  // Future<UserSiswaModel> getCurrentUserSiswa({required String id}) async {
  Future<UserSiswaModel> getCurrentUserSiswa() async {
    // final id = await CustomStorage().getStorage('id');
    final token = await CustomStorage().getStorage('token');
    final url = '$baseUrl/api/v2/student/single/';
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    final jsonResp = jsonDecode(response.body);
    print(jsonResp);

    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(jsonResp);
      return userSiswa;
    } else {
      throw (jsonResp['msg']);
    }
  }

  Future<UserSiswaModel> genereteQrcode({required String id}) async {
    final url = '$baseUrl/api/v2/student/generate-qc?id=$id';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ',
    };
    final response = await http.put(Uri.parse(url), headers: headers);

    final jsonResp = jsonDecode(response.body);
    print(jsonResp);

    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(jsonResp);
      return userSiswa;
    } else {
      throw (jsonResp['msg']);
    }
  }
}
