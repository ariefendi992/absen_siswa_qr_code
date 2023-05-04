import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final Dio dio = Dio();
  String? accessToken;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    accessToken = await CustomStorage().getStorage('token');

    if (accessToken != null && accessToken.toString().isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    options.headers['Content-Type'] = 'application/json';
    options.baseUrl = baseUrl;

    super.onRequest(options, handler);
  }

  // @override
  // Future<void> onResponse(
  //     Response response, ResponseInterceptorHandler handler) async {
  //   print(
  //       'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  //   super.onResponse(response, handler);
  // }

  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    final refToken = await CustomStorage().getStorage('refresh_token');
    if (error.response?.statusCode == 401) {
      // print('the token has expired, need to receive new token');
      final options = error.response!.requestOptions;
      options.headers['Authorization'] = 'Bearer $refToken';
      final response = await dio.post(
        '$baseUrl/api/v2/auth/refresh-token',
        options: Options(
          headers: {'Authorization': 'Bearer $refToken'},
        ),
      );

      options.headers['Authorization'] =
          'Bearer ${response.data['access_token']}';

      if (options.headers['Authorization'] != null) {
        // print('the token has been updated');

        if (response.statusCode == 201) {
          await CustomStorage()
              .setStorage('token', response.data['access_token']);
          final originResult = await dio.fetch(options..path);

          return handler.resolve(originResult);
        }
        // } else {
        //   throw (response.data);
        // }

        // final originResult = await dio.fetch(options..path);
        // if (originResult.statusCode != null &&
        //     originResult.statusCode! ~/ 100 == 2) {
        //   return handler.resolve(originResult);
        // }
      }
      print('the token has not been update');
      return handler.reject(DioError(requestOptions: options));

      // if (response.statusCode == 201) {
      //   await CustomStorage()
      //       .setStorage('token', response.data['access_token']);
      // }
      // await DioAuthSevice().refreshToken();

      // if (await DioAuthSevice().refreshToken()) {
      //   return handler.resolve(await _retry(error.requestOptions));
      // }
    }
    onError(error, handler);
  }
}


// Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
//   final Dio dio = Dio();

//   final options = Options(
//     method: requestOptions.method,
//     headers: requestOptions.headers,
//   );
//   return dio.request<dynamic>(
//     requestOptions.path,
//     data: requestOptions.data,
//     queryParameters: requestOptions.queryParameters,
//     options: options,
//   );
// }
