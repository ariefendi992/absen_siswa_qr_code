part of 'daftar_mapel_cubit.dart';

abstract class DaftarMapelState extends Equatable {
  const DaftarMapelState();

  @override
  List<Object> get props => [];
}

class DaftarMapelInitial extends DaftarMapelState {}

class DaftarMapelLoading extends DaftarMapelState {}

class DaftarMengajarHarianSuccess extends DaftarMapelState {
  final List<JadwalMengajarHarianModel>? jadwal;

  const DaftarMengajarHarianSuccess({this.jadwal});

  @override
  List<Object> get props => [jadwal!];
}

class DaftarMengajarHarianFailed extends DaftarMapelState {
  final String error;
  const DaftarMengajarHarianFailed(this.error);

  @override
  List<Object> get props => [error];
}

class DaftarMapelSiswaSuccess extends DaftarMapelState {
  final List<DaftarMapelSisaModel> mapels;

  const DaftarMapelSiswaSuccess({required this.mapels});

  @override
  List<Object> get props => [mapels];
}

class DaftarMapelSiswaFailed extends DaftarMapelState {
  final String error;
  const DaftarMapelSiswaFailed(this.error);

  @override
  List<Object> get props => [error];
}
