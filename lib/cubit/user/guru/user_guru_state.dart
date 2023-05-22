part of 'user_guru_cubit.dart';

abstract class UserGuruState extends Equatable {
  const UserGuruState();

  @override
  List<Object> get props => [];
}

class UserGuruInitial extends UserGuruState {}

class UserGuruLoading extends UserGuruState {}

class UserGuruSuccess extends UserGuruState {
  final UserGuruModel userGuru;

  const UserGuruSuccess(this.userGuru);

  @override
  List<Object> get props => [userGuru];
}

class UserGuruFailed extends UserGuruState {
  final String error;

  const UserGuruFailed(this.error);

  @override
  List<Object> get props => [error];
}
