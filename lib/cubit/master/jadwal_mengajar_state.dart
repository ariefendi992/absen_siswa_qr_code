part of 'jadwal_mengajar_cubit.dart';

abstract class JadwalMengajarState extends Equatable {
  const JadwalMengajarState();

  @override
  List<Object> get props => [];
}

class JadwalMengajarInitial extends JadwalMengajarState {}

class JadwalMengajarLoading extends JadwalMengajarState {}

class JadwalMengajarSuccess extends JadwalMengajarState {
  final List<JadwalMengajarHariModel>? senin;

  const JadwalMengajarSuccess(this.senin);

  @override
  List<Object> get props => [senin!];
}

class JadwalMengajarFailed extends JadwalMengajarState {
  final String error;

  const JadwalMengajarFailed(this.error);

  @override
  List<Object> get props => [error];
}
