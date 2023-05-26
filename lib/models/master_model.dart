import 'package:equatable/equatable.dart';

class MapelSiswaModel extends Equatable {
  final int id;
  final String namaGuru;
  final String mapel;

  const MapelSiswaModel({
    required this.id,
    required this.mapel,
    required this.namaGuru,
  });

  factory MapelSiswaModel.fromJson(Map<String, dynamic> json) {
    return MapelSiswaModel(
      id: json['id'],
      mapel: json['mapel'],
      namaGuru: json['nama_guru'],
    );
  }

  @override
  List<Object?> get props => [id, namaGuru, mapel];
}

class JadwalMengajarHarianModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;
  final String? today;

  const JadwalMengajarHarianModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
    this.today,
  });

  factory JadwalMengajarHarianModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarHarianModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
      today: json['today'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}

class JadwalMengajarSeninModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;

  const JadwalMengajarSeninModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
  });

  factory JadwalMengajarSeninModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarSeninModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}

class JadwalMengajarSelasaModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;

  const JadwalMengajarSelasaModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
  });

  factory JadwalMengajarSelasaModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarSelasaModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}

class JadwalMengajarRabuModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;

  const JadwalMengajarRabuModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
  });

  factory JadwalMengajarRabuModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarRabuModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}

class JadwalMengajarKamisModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;

  const JadwalMengajarKamisModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
  });

  factory JadwalMengajarKamisModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarKamisModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}

class JadwalMengajarJumatModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;

  const JadwalMengajarJumatModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
  });

  factory JadwalMengajarJumatModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarJumatModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}

class JadwalMengajarSepekanModel extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final String? hari;

  const JadwalMengajarSepekanModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.kodeMengajar,
    this.mapel,
    this.jamMulai,
    this.jamSelesai,
    this.semester,
    this.kelas,
    this.hari,
  });

  factory JadwalMengajarSepekanModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarSepekanModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      hari: json['hari'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        kodeMengajar,
        mapel,
        jamMulai,
        jamSelesai,
        semester,
        kelas,
        hari,
      ];
}
