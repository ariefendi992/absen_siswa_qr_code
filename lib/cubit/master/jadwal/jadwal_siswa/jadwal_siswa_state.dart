part of 'jadwal_siswa_cubit.dart';

class JadwalSiswaState extends Equatable {
  const JadwalSiswaState();

  @override
  List<Object> get props => [];
}

class JadwalSiswaInitial extends JadwalSiswaState {}

class JadwalSiswaLoading extends JadwalSiswaState {}

class JadwalHarianSiswaSuccess extends JadwalSiswaState {
  final List<JadwalPelajaranSiswaModel> jadwal;

  const JadwalHarianSiswaSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalHarianFailure extends JadwalSiswaState {
  final String error;

  const JadwalHarianFailure(this.error);

  @override
  List<Object> get props => [error];
}

class JadwalPelajaranSiswaSuccess extends JadwalSiswaState {
  final Map<String, List<JadwalPelajaranSiswaModel>> jadwal;

  const JadwalPelajaranSiswaSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalPelajaranSiswaFailure extends JadwalSiswaState {
  final String error;

  const JadwalPelajaranSiswaFailure(this.error);

  @override
  List<Object> get props => [error];
}
