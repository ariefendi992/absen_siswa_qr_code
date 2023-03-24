import 'package:absen_siswa_qr_code/models/auth_model.dart';
import 'package:absen_siswa_qr_code/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String username, required String password}) async {
    try {
      emit(AuthLoading());

      AuthModel userAuth = await AuthService().login(
        username: username,
        password: password,
      );

      emit(AuthSuccess(userAuth));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logOut() async {
    try {
      emit(AuthLoading());
      await AuthService().logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
