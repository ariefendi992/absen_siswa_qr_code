import 'package:absen_siswa_qr_code/utils/secure_storage.dart';
import 'package:absen_siswa_qr_code/utils/url.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends QueuedInterceptorsWrapper {
  String? accessToken;
  String? refreshToken;
  CustomStorage storage = CustomStorage();
  final Dio dio = Dio();

  void configurationDio(options) {
    options.baseUrl = '$baseUrl/api/v2/';
    options.connectTimeout = Duration(seconds: 5);
    options.receiveTimeout = Duration(seconds: 3);
  }

  void setHeaderAuthorization(options, accessToken) {
    options.headers['Authorization'] = 'Bearer $accessToken';
  }

  @override
  Future<void> onRequest(options, handler) async {
    accessToken = await storage.getStorage('access_token');
    refreshToken = await storage.getStorage('refresh_token');
    // print('ACCESS TOKEN => $accessToken');
    // print('REFRESH TOKEN => $refreshToken');
    configurationDio(options);
    // print('BASE URL => ${options.baseUrl}');
    if (accessToken != null) {
      setHeaderAuthorization(options, accessToken);
    }
    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(response, handler) async {
    // print(
    //     'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(error, handler) async {
    if (error.response != null) {
      // print(
      //     'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');

      if (error.response!.statusCode == 401) {
        // print('The token has been expire');

        final options = error.requestOptions;
        refreshToken = await storage.getStorage('refresh_token');

        try {
          final responseToken = await dio.post(
            '$baseUrl/api/v2/auth/refresh-token',
            options: Options(headers: {
              'Authorization': 'Bearer $refreshToken',
              'Content-Type': 'application/json',
            }),
          );

          await storage.setStorage(
              'access_token', responseToken.data['access_token']);
          await storage.setStorage(
              'refresh_token', responseToken.data['refresh_token']);
          accessToken = responseToken.data['access_token'];

          setHeaderAuthorization(options, accessToken);

          if (options.headers['Authorization'] != null) {
            // print('the token has been updated');

            final response = await dio.fetch(options..path);
            // print('RESPONSE AFTER 401 $response');
            // print('RESPONSE TOKEN => [${responseToken.statusCode}]');

            if (response.statusCode != null &&
                response.statusCode! ~/ 100 == 2) {
              return handler.resolve(response);
            }
          }
          // print('the token has not been updated');
          return handler.reject(
            DioError(requestOptions: options),
          );
        } on DioError catch (e) {
          print(e.toString());
          throw e.toString();
          // if (error.response?.statusCode == 401) {}
          // print('Response ===> ${e.response?.statusCode}');
        }
      } else if (error.response?.statusCode == 404) {
        try {
          print(error.response?.data);
        } on DioError catch (e) {
          print(e.toString());
        }
      } else if (error.response?.statusCode == 409) {
        try {
          print(error.response?.data);
        } on DioError catch (e) {
          throw Exception('${e.response?.data["msg"]}');
        }
      }
    }
    super.onError(error, handler);
  }
}

// Future refreshNewToken() async {
//   Response response;
//   CustomStorage repository = CustomStorage();
//   var dio = Dio();

//   var refreshToken = await repository.getStorage('refresh_token');
//   dio.options.headers["Authorization"] = "Bearer " + refreshToken;
//   response = await dio.post('$baseUrl/api/v2/auth/refresh-token');
//   if (response.statusCode == 201) {
//     // await repository.setStorage(
//     //   'access_token',
//     //   response.data['access_token'],
//     // );
//     print('NEW TOKEN => [${response.data["access_token"]}]');
//   } else {
//     print(response.toString());
//   }
// }
