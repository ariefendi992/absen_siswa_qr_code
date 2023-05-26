part of 'jadwal_senin_cubit.dart';

abstract class JadwalSeninState extends Equatable {
  const JadwalSeninState();

  @override
  List<Object> get props => [];
}

class JadwalSeninInitial extends JadwalSeninState {}

class JadwalSeninLoading extends JadwalSeninState {}

class JadwalSeninSuccess extends JadwalSeninState {
  final List<JadwalMengajarSeninModel> jadwal;

  const JadwalSeninSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalSeninFail extends JadwalSeninState {
  final String error;

  const JadwalSeninFail(this.error);

  @override
  List<Object> get props => [error];
}
