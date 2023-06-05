import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/dio_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_guru_state.dart';

class UserGuruCubit extends Cubit<UserGuruState> {
  UserGuruCubit() : super(UserGuruInitial());

  void currenUserGuru() async {
    try {
      emit(UserGuruLoading());

      final userGuru = await ApiUserGuru().getCurrentGuru();

      emit(UserGuruSuccess(userGuru));
    } on DioError catch (e) {
      emit(UserGuruFailed('${e.response?.data['msg'].toString()}'));
    }
  }

  void updateUserGuru({required Map<String, dynamic> data}) async {
    try {
      emit(UserGuruLoading());

      final userGuru = await ApiUserGuru().updateProfilGuru(data: data);
      emit(UserGuruSuccess(userGuru));
    } on DioError catch (e) {
      emit(UserGuruFailed('${e.response?.data["msg"]}'));
    }
  }

  void checkPassGuru({required Map<String, dynamic> data}) async {
    try {
      emit(UserGuruLoading());

      final userGuru = await ApiUserGuru().checkPasswordGuru(data: data);
      emit(UserGuruSuccess(userGuru));
    } on DioError catch (e) {
      emit(UserGuruFailed('${e.response?.data["msg"]}'));
    }
  }

  void updatePassGuru({required Map<String, dynamic> data}) async {
    try {
      emit(UserGuruLoading());

      final userGuru = await ApiUserGuru().updatePasswordGuru(data: data);
      emit(UserGuruUpdatePassSuccess(userGuru));
    } on DioError catch (e) {
      emit(UserGuruUpdateFailed('${e.response?.data["msg"]}'));
    }
  }
}
