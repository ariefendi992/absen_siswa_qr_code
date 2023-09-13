part of 'data_pelanggaran_cubit.dart';

class DataPelanggaranState extends Equatable {
  const DataPelanggaranState();

  @override
  List<Object> get props => [];
}

class DataPelanggaranInitial extends DataPelanggaranState {}

class DataPelanggaranLoading extends DataPelanggaranState {}

class DataPelanggaranSuccess extends DataPelanggaranState {
  final List<DaftarPelanggarModel> dataPelanggaran;

  const DataPelanggaranSuccess(this.dataPelanggaran);

  @override
  List<Object> get props => [dataPelanggaran];
}

class DataPelanggaranFailure extends DataPelanggaranState {
  final String error;

  const DataPelanggaranFailure(this.error);

  @override
  List<Object> get props => [error];
}

class RiwayatPelanggaranSiswaSuccess extends DataPelanggaranState {
  final RiwayatPelanggaranSiswaModel pelanggaran;

  const RiwayatPelanggaranSiswaSuccess(this.pelanggaran);

  @override
  List<Object> get props => [pelanggaran];
}

class RiwayatPelanggaranSiswaFail extends DataPelanggaranState {
  final String error;

  const RiwayatPelanggaranSiswaFail(this.error);

  @override
  List<Object> get props => [error];
}
