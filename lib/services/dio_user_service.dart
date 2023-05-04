import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';

class ApiUserSiswa {
  final Dio dio = Dio();

  ApiUserSiswa() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<UserSiswaModel> getCurrentSiswa() async {
    final response = await dio.get('/api/v2/student/single');

    final jsonResp = response.data;
    // print('dio getCurrentSiswa === ${jsonResp.toString()}');
    if (response.statusCode == 200) {
      UserSiswaModel userSiswa = UserSiswaModel.fromJson(jsonResp);
      return userSiswa;
    } else {
      throw (jsonResp['msg']);
    }
  }
}
