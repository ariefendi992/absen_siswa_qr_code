part of 'jadwal_kamis_cubit.dart';

abstract class JadwalKamisState extends Equatable {
  const JadwalKamisState();

  @override
  List<Object> get props => [];
}

class JadwalKamisInitial extends JadwalKamisState {}

class JadwalKamisLoading extends JadwalKamisState {}

class JadwalKamisSuccess extends JadwalKamisState {
  final List<JadwalMengajarKamisModel> jadwal;

  const JadwalKamisSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalKamisFailure extends JadwalKamisState {
  final String error;

  const JadwalKamisFailure(this.error);

  @override
  List<Object> get props => [error];
}
