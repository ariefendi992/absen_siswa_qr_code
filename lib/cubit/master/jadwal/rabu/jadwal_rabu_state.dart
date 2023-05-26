part of 'jadwal_rabu_cubit.dart';

abstract class JadwalRabuState extends Equatable {
  const JadwalRabuState();

  @override
  List<Object> get props => [];
}

class JadwalRabuInitial extends JadwalRabuState {}

class JadwalRabuLoading extends JadwalRabuState {}

class JadwalRabuSuccess extends JadwalRabuState {
  final List<JadwalMengajarRabuModel> jadwal;

  const JadwalRabuSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalRabuFail extends JadwalRabuState {
  final String error;

  const JadwalRabuFail(this.error);

  @override
  List<Object> get props => [error];
}
