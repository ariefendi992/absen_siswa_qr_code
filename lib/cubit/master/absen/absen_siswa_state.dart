part of 'absen_siswa_cubit.dart';

abstract class AbsenSiswaState extends Equatable {
  const AbsenSiswaState();

  @override
  List<Object> get props => [];
}

class AbsenSiswaInital extends AbsenSiswaState {}

class AbsenSiswaLoading extends AbsenSiswaState {}

class AbsenSiswaSuccess extends AbsenSiswaState {
  final AbsenSiswaModel absenSiswa;

  const AbsenSiswaSuccess(this.absenSiswa);

  @override
  List<Object> get props => [absenSiswa];
}

class AbsenSiswaFailure extends AbsenSiswaState {
  final String error;

  const AbsenSiswaFailure(this.error);

  @override
  List<Object> get props => [error];
}
