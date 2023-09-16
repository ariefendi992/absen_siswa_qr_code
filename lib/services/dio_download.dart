import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFromAPI {
  final dio = Dio();
  final CustomStorage storage = CustomStorage();

  DownloadFromAPI() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<void> downloadIDCard(String url, String filename) async {
    final directory = await getApplicationDocumentsDirectory();

    final response = await dio.download(
      "${baseUrl}/${url}",
      '${directory.path}/${filename}',
    );

    print(response.statusCode);
    // print(directory.path);
  }
}
