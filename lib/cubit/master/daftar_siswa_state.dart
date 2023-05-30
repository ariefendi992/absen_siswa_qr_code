part of 'daftar_siswa_cubit.dart';

abstract class DaftarSiswaSate extends Equatable {
  const DaftarSiswaSate();

  @override
  List<Object> get props => [];
}

class DaftarSiswaInitial extends DaftarSiswaSate {}

class DaftarSiswaLoading extends DaftarSiswaSate {}

class DaftarSiswaSuccess extends DaftarSiswaSate {
  final List<DaftarSiswaModel> daftarSiswa;

  const DaftarSiswaSuccess(
    this.daftarSiswa,
  );

  @override
  List<Object> get props => [daftarSiswa];
}

class DaftarSiswaFailure extends DaftarSiswaSate {
  final String error;

  const DaftarSiswaFailure(this.error);

  @override
  List<Object> get props => [error];
}
