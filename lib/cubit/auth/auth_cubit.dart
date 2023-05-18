import 'package:absen_siswa_qr_code/models/auth_model.dart';
import 'package:absen_siswa_qr_code/services/dio_auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String username, required String password}) async {
    try {
      emit(AuthLoading());

      // AuthModel userAuth = await AuthService().login(
      AuthModel userAuth = await DioAuthSevice().dioLogin(
        username: username,
        password: password,
      );

      emit(AuthSuccess(userAuth));
    } on DioError catch (e) {
      emit(AuthFailed('${e.response?.data["msg"]}'));
    }
  }

  void logOut() async {
    try {
      emit(AuthLoading());
      // await AuthService().logOut();
      await DioAuthSevice().logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
