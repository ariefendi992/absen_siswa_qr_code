part of 'scan_siswa_cubit.dart';

abstract class ScanSiswaState extends Equatable {
  const ScanSiswaState();

  @override
  List<Object> get props => [];
}

class ScanSiswaInitial extends ScanSiswaState {}

class ScanSiswaLoading extends ScanSiswaState {}

class ScanSiswaSuccess extends ScanSiswaState {
  final ScanSiswaModel siswaData;

  const ScanSiswaSuccess({required this.siswaData});

  @override
  List<Object> get props => [siswaData];
}

class ScanSiswaFailure extends ScanSiswaState {
  final String error;

  const ScanSiswaFailure(this.error);

  @override
  List<Object> get props => [error];
}
