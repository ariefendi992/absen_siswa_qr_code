import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:absen_siswa_qr_code/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_siswa_state.dart';

class UserSiswaCubit extends Cubit<UserSiswaState> {
  UserSiswaCubit() : super(UserSiswaInitial());

  void getCurrentUser({required String id}) async {
    try {
      emit(UserSiswaLoading());
      UserSiswaModel user = await UserService().getCurrentUserSiswa(id: id);
      emit(UserSiswaSuccess(user));
    } catch (e) {
      emit(UserSiswaFailed(e.toString()));
    }
  }
}
