part of 'jadwal_siswa_cubit.dart';

class JadwalSiswaState extends Equatable {
  const JadwalSiswaState();

  @override
  List<Object> get props => [];
}

class JadwalSiswaInitial extends JadwalSiswaState {}

class JadwalSiswaLoading extends JadwalSiswaState {}

class JadwalHarianSiswaSuccess extends JadwalSiswaState {
  final List<JadwalHarianSiswaModel> jadwal;

  const JadwalHarianSiswaSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalSiswaFailure extends JadwalSiswaState {
  final String error;

  const JadwalSiswaFailure(this.error);

  @override
  List<Object> get props => [error];
}
