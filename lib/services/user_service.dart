import 'dart:convert';
import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserSiswaModel> getCurrentUserSiswa({required String id}) async {
    // final id = await CustomStorage().getStorage('id');
    final url = '$baseUrl/api/v2/student/single/$id';
    final response = await http.get(Uri.parse(url));

    final jsonResp = jsonDecode(response.body);

    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(jsonResp);
      return userSiswa;
    } else {
      throw (jsonResp['msg']);
    }
  }
}
