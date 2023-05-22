import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:absen_siswa_qr_code/services/http/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_siswa_state.dart';

class UserSiswaCubit extends Cubit<UserSiswaState> {
  UserSiswaCubit() : super(UserSiswaInitial());

  void getCurrentUser() async {
    // void getCurrentUser({required String id}) async {
    try {
      emit(UserSiswaLoading());
      UserSiswaModel user =
          // await UserSiswaService().getCurrentUserSiswa(id: id);
          // await UserSiswaService().getCurrentUserSiswa();
          await ApiUserSiswa().getCurrentSiswa();
      emit(UserSiswaSuccess(user));
    } catch (e) {
      emit(UserSiswaFailed(e.toString()));
    }
  }

  void generatedQrCode({required String id}) async {
    try {
      emit(UserSiswaLoading());
      UserSiswaModel userSiswa =
          await UserSiswaService().genereteQrcode(id: id);
      emit(UserSiswaSuccess(userSiswa));
    } catch (e) {
      emit(UserSiswaFailed(e.toString()));
    }
  }

  void getSiswaByUsername({required String username}) async {
    try {
      emit(UserSiswaLoading());
      UserSiswaModel userSiswa =
          await ApiUserSiswa().getSiswaByUsername(username: username);
      emit(UserSiswaSuccess(userSiswa));
    } on DioError catch (e) {
      emit(UserSiswaFailed('${e.response?.data['msg'].toString()}'));
    }
  }
}
