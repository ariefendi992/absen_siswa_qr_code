import 'dart:convert';
import 'package:absen_siswa_qr_code/models/auth_model.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:absen_siswa_qr_code/utils/shared_preferences.dart';

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

    if (response.statusCode == 200) {
      await CustomPreferenses().setString('id', jsonResp['id']);
      AuthModel auth = AuthModel.fromJson(jsonResp);

      return auth;
    } else {
      final jsonResp = jsonDecode(response.body);
      throw (jsonResp['msg']);
    }
  }
}
