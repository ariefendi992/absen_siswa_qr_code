part of 'siswa_mapel_cubit.dart';

abstract class SiswaMapelState extends Equatable {
  const SiswaMapelState();

  @override
  List<Object> get props => [];
}

class SiswaMapelInitial extends SiswaMapelState {}

class SiswaMapelLoading extends SiswaMapelState {}

class SiswaMapelSuccess extends SiswaMapelState {
  final List<MapelSiswaModel> mapels;

  const SiswaMapelSuccess(this.mapels);

  @override
  List<Object> get props => [mapels];
}

class SiswaMapelFailed extends SiswaMapelState {
  final String error;
  const SiswaMapelFailed(this.error);

  @override
  List<Object> get props => [error];
}
