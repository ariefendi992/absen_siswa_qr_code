import 'package:absen_siswa_qr_code/services/interceptor/dio_interceptor.dart';
import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
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
    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/$filename';
    final url = "${baseUrl}/api/v2/download/idcard?siswa=${userID}";
    await dio.download(
      url,
      path,
    );

    await GallerySaver.saveImage(path, albumName: 'SistemMonitoring');
  }
}
