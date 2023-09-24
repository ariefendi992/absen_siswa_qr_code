import 'package:absen_siswa_qr_code/models/auth_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';

class DioAuthSevice {
  final Dio dio = Dio();
  CustomStorage storage = CustomStorage();
  String? accessToken;
  String? refreshToken;

  DioAuthSevice() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<AuthModel> dioLogin({String? username, String? password}) async {
    final loginData = {
      'username': username,
      'password': password,
    };
    final response =
        await dio.post('$baseUrl/api/v2/auth/login', data: loginData);

    final body = response.data;

    // print(body['access_token']);

    if (response.statusCode == 200) {
      await storage.setStorage('id', body['id'].toString());
      // await storage.setStorage('token', body['access_token']);
      await storage.setStorage('access_token', body['access_token']);
      await storage.setStorage('refreshToken', body['refresh_token']);
      await storage.setStorage('group', body['group']);

      DateTime setTimeString = DateTime.now().add(
        Duration(
          seconds: int.parse(body['jwt_refresh_token_exp']) - 60,
        ),
      );

      await storage.setStorage('refTokenExp', setTimeString.toString());

      AuthModel auth = AuthModel.fromJson(response.data);
      return auth;
    } else {
      throw (body['msg']);
    }
  }

  Future<void> logOut() async {
    final response = await dio.delete('auth/logout');

    if (response.statusCode == 200) {
      await storage.deleteKey('group');
      await storage.deleteKey('id');
      await storage.deleteKey('token');
      await storage.deleteKey('refreshToken');
      await storage.deleteKey('today');
    }
  }
}
