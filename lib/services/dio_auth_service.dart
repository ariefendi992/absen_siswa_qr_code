import 'package:absen_siswa_qr_code/models/auth_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';

class DioAuthSevice {
  final Dio dio = Dio();
  String? accessToken;

  DioAuthSevice() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<AuthModel> dioLogin({String? username, String? password}) async {
    final loginData = {
      'username': username,
      'password': password,
    };
    final response = await dio.post('/api/v2/auth/login', data: loginData);

    final jsonResp = response.data;

    if (response.statusCode == 200) {
      await CustomStorage().setStorage('token', jsonResp['access_token']);
      await CustomStorage()
          .setStorage('refresh_token', jsonResp['refresh_token']);
      await CustomStorage().setStorage('group', jsonResp['group']);
      AuthModel auth = AuthModel.fromJson(response.data);
      return auth;
    } else {
      throw (jsonResp['msg']);
    }
  }

  Future<void> logOut() async {
    final response = await dio.delete('$baseUrl/api/v2/auth/logout');

    if (response.statusCode == 200) {
      await CustomStorage().deleteKey('group');
      await CustomStorage().deleteKey('id');
      // await CustomStorage().deleteKey('token');
      await CustomStorage().deleteKey('refresh_token');
      print(response.data);
    }
  }

  // Future<bool> refreshToken() async {
  //   final refreshToken = await CustomStorage().getStorage('refresh_token');
  //   final options = Options(headers: {'Authorization': 'Bearer $refreshToken'});
  //   final response =
  //       await dio.post('$baseUrl/api/v2/auth/refresh-token', options: options);

  //   if (response.statusCode == 201) {
  //     accessToken = response.data['access_token'];
  //     await CustomStorage().setStorage('token', accessToken);
  //     return true;
  //   } else {
  //     // refresh token is wrong
  //     accessToken = null;
  //     CustomStorage().deleteKey('token');
  //     return false;
  //   }
  // }
}
