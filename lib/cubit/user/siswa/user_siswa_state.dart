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

class UserSiswaUpdatePassSuccess extends UserSiswaState {
  final UserSiswaModel siswa;

  const UserSiswaUpdatePassSuccess(this.siswa);

  @override
  List<Object> get props => [siswa];
}

class UsersiswaUpdatePassFail extends UserSiswaState {
  final String error;

  const UsersiswaUpdatePassFail(this.error);

  @override
  List<Object> get props => [error];
}

class UserSiswaFailed extends UserSiswaState {
  final String error;
  const UserSiswaFailed(this.error);

  @override
  List<Object> get props => [error];
}
