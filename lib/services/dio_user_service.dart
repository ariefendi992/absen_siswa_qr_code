import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';

class ApiUserSiswa {
  final Dio dio = Dio();

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
    final response = await dio.get('/student/single-siswa?nisn=$username');

    final body = response.data;

    print('PRINT FROM DIO USER SERVICE BY NISN ==>> $body');

    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(body);

      return userSiswa;
    } else {
      throw (body['msg'].toString());
    }
  }
}
