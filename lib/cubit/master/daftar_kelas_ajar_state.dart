part of 'daftar_kelas_ajar_cubit.dart';

abstract class KelasAjarState extends Equatable {
  const KelasAjarState();

  @override
  List<Object> get props => [];
}

class KelasAjarInitial extends KelasAjarState {}

class KelasAjarLoading extends KelasAjarState {}

class KelasAjarSuccess extends KelasAjarState {
  final List<DaftarKelasAjarModel> daftarKelas;

  const KelasAjarSuccess(this.daftarKelas);

  @override
  List<Object> get props => [daftarKelas];
}

class KelasAjarFailure extends KelasAjarState {
  final String error;

  const KelasAjarFailure(this.error);

  @override
  List<Object> get props => [error];
}
