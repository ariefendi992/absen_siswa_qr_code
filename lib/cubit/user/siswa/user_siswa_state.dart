part of 'user_siswa_cubit.dart';

abstract class UserSiswaState extends Equatable {
  const UserSiswaState();

  @override
  List<Object> get props => [];
}

class UserSiswaInitial extends UserSiswaState {}

class UserSiswaLoading extends UserSiswaState {}

class UserSiswaSuccess extends UserSiswaState {
  final UserSiswaModel userSiswa;
  const UserSiswaSuccess(this.userSiswa);

  @override
  List<Object> get props => [userSiswa];
}

class UserSiswaFailed extends UserSiswaState {
  final String error;
  const UserSiswaFailed(this.error);

  @override
  List<Object> get props => [error];
}
