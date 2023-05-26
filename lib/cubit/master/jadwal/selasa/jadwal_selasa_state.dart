part of 'jadwal_selasa_cubit.dart';

abstract class JadwalSelasaState extends Equatable {
  const JadwalSelasaState();

  @override
  List<Object> get props => [];
}

class JadwalSelasaInitial extends JadwalSelasaState {}

class JadwalSelasaLoading extends JadwalSelasaState {}

class JadwalSelasaSuccess extends JadwalSelasaState {
  final List<JadwalMengajarSelasaModel> jadwal;

  const JadwalSelasaSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalSelasaFail extends JadwalSelasaState {
  final String error;

  const JadwalSelasaFail(this.error);

  @override
  List<Object> get props => [error];
}
