import 'dart:convert';
import 'package:absen_siswa_qr_code/models/auth_model.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<AuthModel> login({String? username, String? password}) async {
    final url = ('$baseUrl/api/v2/auth/login');

    final headers = {'Content-Type': 'application/json'};
    final data = jsonEncode({
      'username': username,
      'password': password,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: data,
    );

    final jsonResp = jsonDecode(response.body);

    print(jsonResp.toString());
    if (response.statusCode == 200) {
      await CustomStorage().setStorage('id', jsonResp['id'].toString());
      await CustomStorage().setStorage('group', jsonResp['group']);
      AuthModel auth = AuthModel.fromJson(jsonResp);

      return auth;
    } else {
      throw (jsonResp['msg']);
    }
  }

  Future logOut() async {
    try {
      await CustomStorage().deleteAllKey();
    } catch (e) {
      rethrow;
    }
  }
}
