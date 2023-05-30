import 'dart:convert';

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
  final String firstName;
  final String lastName;
  final String kodeMengajar;
  final String mapel;
  final String jamMulai;
  final String jamSelesai;
  final String semester;
  final String kelas;
  final String hari;

  const JadwalMengajarKamisModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.kodeMengajar,
    required this.mapel,
    required this.jamMulai,
    required this.jamSelesai,
    required this.semester,
    required this.kelas,
    required this.hari,
  });

  JadwalMengajarKamisModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? kodeMengajar,
    String? mapel,
    String? jamMulai,
    String? jamSelesai,
    String? semester,
    String? kelas,
    String? hari,
  }) =>
      JadwalMengajarKamisModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        kodeMengajar: kodeMengajar ?? this.kodeMengajar,
        mapel: mapel ?? this.mapel,
        jamMulai: jamMulai ?? this.jamMulai,
        jamSelesai: jamSelesai ?? this.jamSelesai,
        semester: semester ?? this.semester,
        kelas: kelas ?? this.kelas,
        hari: hari ?? this.hari,
      );

  factory JadwalMengajarKamisModel.fromRawJson(String str) =>
      JadwalMengajarKamisModel.fromJson(jsonDecode(str));

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

class DaftarKelasAjarModel extends Equatable {
  final int mengajarId;
  final int kelasId;
  final String kelas;
  final String semester;
  final String waliKelas;

  const DaftarKelasAjarModel({
    required this.mengajarId,
    required this.kelasId,
    required this.kelas,
    required this.semester,
    required this.waliKelas,
  });

  factory DaftarKelasAjarModel.fromJson(Map<String, dynamic> json) =>
      DaftarKelasAjarModel(
        mengajarId: json['mengajar_id'],
        kelasId: json['kelas_id'],
        kelas: json['kelas'],
        semester: json['semester'],
        waliKelas: json['wali_kelas'],
      );

  @override
  List<Object> get props => [mengajarId, kelasId, kelas, semester, waliKelas];
}

class DaftarSiswaModel extends Equatable {
  final int siswaId;
  final String firstName;
  final String lastName;
  final String kelasId;
  final String kelas;
  final String? waliKelas;

  const DaftarSiswaModel({
    required this.siswaId,
    required this.firstName,
    required this.lastName,
    required this.kelasId,
    required this.kelas,
    this.waliKelas,
  });

  DaftarSiswaModel copyWith({
    int? siswaId,
    String? firstName,
    String? lastName,
    String? kelasId,
    String? kelas,
    String? waliKelas,
  }) =>
      DaftarSiswaModel(
        siswaId: siswaId ?? this.siswaId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        kelasId: kelasId ?? this.kelasId,
        kelas: kelas ?? this.kelas,
      );

  factory DaftarSiswaModel.rawFromJson(String str) =>
      DaftarSiswaModel.fromJson(json.decode(str));

  factory DaftarSiswaModel.fromJson(Map<String, dynamic> json) =>
      DaftarSiswaModel(
          siswaId: json['siswa_id'],
          firstName: json['first_name'],
          lastName: json['last_name'],
          kelasId: json['kelas_id'].toString(),
          kelas: json['kelas'],
          waliKelas: json['wali_kelas']);

  @override
  List<Object?> get props =>
      [siswaId, firstName, lastName, kelasId, kelas, waliKelas];
}
