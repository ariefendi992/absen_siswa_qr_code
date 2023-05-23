part of 'jadwal_mapel_cubit.dart';

abstract class JadwalMapelState extends Equatable {
  const JadwalMapelState();

  @override
  List<Object> get props => [];
}

class JadwalMapelInitial extends JadwalMapelState {}

class JadwalMapelLoading extends JadwalMapelState {}

class JadwalMapelSuccess extends JadwalMapelState {
  final List<MapelSiswaModel>? mapels;
  final List<JadwalMengajarHarianModel>? jadwalMapel;

  const JadwalMapelSuccess({
    this.mapels,
    this.jadwalMapel,
  });

  @override
  List<Object> get props => [mapels!, jadwalMapel!];
}

class JadwalMapelFailed extends JadwalMapelState {
  final String error;
  const JadwalMapelFailed(this.error);

  @override
  List<Object> get props => [error];
}
