part of 'jadwal_sepekan_cubit.dart';

abstract class JadwalSepekanState extends Equatable {
  const JadwalSepekanState();

  @override
  List<Object> get props => [];
}

class JadwalSepekanInitial extends JadwalSepekanState {}

class JadwalSepekanLoading extends JadwalSepekanState {}

class JadwalSepekanSuccess extends JadwalSepekanState {
  final List<JadwalMengajarSepekanModel> jadwal;

  const JadwalSepekanSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}

class JadwalSepekanFailure extends JadwalSepekanState {
  final String error;

  const JadwalSepekanFailure(this.error);

  @override
  List<Object> get props => [error];
}
