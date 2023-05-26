part of 'jadwal_jumat_cubit.dart';

abstract class JadwalJumatState extends Equatable {
  const JadwalJumatState();

  @override
  List<Object> get props => [];
}

class JadwalJumatInitial extends JadwalJumatState {}

class JadwalJumatLoading extends JadwalJumatState {}

class JadwalJumatSuccess extends JadwalJumatState {
  final List<JadwalMengajarJumatModel> jadwal;

  const JadwalJumatSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalJumatFailure extends JadwalJumatState {
  final String error;

  const JadwalJumatFailure(this.error);

  @override
  List<Object> get props => [error];
}
