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

class RiwayatAbsenStateSuccess extends AbsenSiswaState {
  final Map<String, List<RAbsensiModel>> riwayatAbsen;

  const RiwayatAbsenStateSuccess(this.riwayatAbsen);

  @override
  List<Object> get props => [riwayatAbsen];
}

class RiwayatAbsenStateFailure extends AbsenSiswaState {
  final String error;

  const RiwayatAbsenStateFailure(this.error);

  @override
  List<Object> get props => [error];
}

class RiwayatAbsenSiswaSuccess extends AbsenSiswaState {
  final Map<String, List<RiwayatAbsenSiswa>> riwayatAbsen;

  const RiwayatAbsenSiswaSuccess(this.riwayatAbsen);

  @override
  List<Object> get props => [riwayatAbsen];
}

class RiwayatAbsenSiswaFail extends AbsenSiswaState {
  final String error;

  const RiwayatAbsenSiswaFail(this.error);

  @override
  List<Object> get props => [error];
}
