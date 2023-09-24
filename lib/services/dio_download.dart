import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFromAPI {
  final dio = Dio();
  final CustomStorage storage = CustomStorage();

  DownloadFromAPI() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<void> downloadIDCard(
    // String url,
    String userID,
    String filename,
  ) async {
    final directory = await getExternalStorageDirectory();
    final url = "${baseUrl}/api/v2/download/idcard?siswa=${userID}";

    final response = await dio.download(
      url,
      '${directory?.path}/${filename}',
    );

    // print(response.statusCode);
    response.statusCode;
  }
}
