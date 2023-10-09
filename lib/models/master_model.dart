import 'dart:convert';

import 'package:equatable/equatable.dart';

class DaftarMapelSisaModel extends Equatable {
  final int id;
  final String namaGuru;
  final String mapel;
  final String kelas;

  const DaftarMapelSisaModel({
    required this.id,
    required this.mapel,
    required this.kelas,
    required this.namaGuru,
  });

  factory DaftarMapelSisaModel.fromJson(Map<String, dynamic> json) {
    return DaftarMapelSisaModel(
      id: json['id'],
      mapel: json['mapel'],
      kelas: json['kelas'],
      namaGuru: json['nama_guru'],
    );
  }

  @override
  List<Object?> get props => [id, namaGuru, mapel];
}

class JadwalMengajarHarianModel extends Equatable {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? kodeMengajar;
  final String? mapel;
  final String? jamMulai;
  final String? jamSelesai;
  final String? semester;
  final String? kelas;
  final int? kelasID;
  final String? hari;
  final String? today;
  final String? waliKelas;
  final Map<String, dynamic>? additionalData;

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
    this.kelasID,
    this.hari,
    this.today,
    this.waliKelas,
    this.additionalData,
  });

  factory JadwalMengajarHarianModel.fromJson(Map<String, dynamic> json) {
    return JadwalMengajarHarianModel(
      id: json['id'].toString(),
      firstName: json['first_name'],
      lastName: json['last_name'],
      kodeMengajar: json['kode_mengajar'],
      mapel: json['mapel'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      semester: json['semester'],
      kelas: json['kelas'],
      kelasID: json['kelas_id'],
      hari: json['hari'],
      today: json['today'],
      waliKelas: json['wali_kelas'],
      additionalData: json,
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
  final String? foto;

  const DaftarKelasAjarModel({
    required this.mengajarId,
    required this.kelasId,
    required this.kelas,
    required this.semester,
    required this.waliKelas,
    this.foto,
  });

  factory DaftarKelasAjarModel.fromJson(Map<String, dynamic> json) =>
      DaftarKelasAjarModel(
        mengajarId: json['mengajar_id'],
        kelasId: json['kelas_id'],
        kelas: json['kelas'],
        semester: json['semester'],
        waliKelas: json['wali_kelas'],
        foto: json['foto'],
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
  final String? foto;

  const DaftarSiswaModel({
    required this.siswaId,
    required this.firstName,
    required this.lastName,
    required this.kelasId,
    required this.kelas,
    this.waliKelas,
    this.foto,
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
        waliKelas: json['wali_kelas'],
        foto: json['foto'],
      );

  @override
  List<Object?> get props =>
      [siswaId, firstName, lastName, kelasId, kelas, waliKelas];
}

class DaftarPelanggarModel extends Equatable {
  final int id;
  final int urut;
  final String poin;
  final String namaSiswa;

  const DaftarPelanggarModel({
    required this.id,
    required this.urut,
    required this.poin,
    required this.namaSiswa,
  });

  factory DaftarPelanggarModel.fromJson(Map<String, dynamic> json) =>
      DaftarPelanggarModel(
        id: json['id'],
        urut: json['urut'],
        poin: json['poin'],
        namaSiswa: json['nama_siswa'],
      );

  @override
  List<Object> get props => [id, urut, poin, namaSiswa];
}

class JadwalPelajaranSiswaModel extends Equatable {
  final int id;
  final String mapel;
  final String mulai;
  final String selesai;
  final String jamKe;
  final String guru;
  final String? hari;
  final String? kelasID;

  const JadwalPelajaranSiswaModel({
    required this.id,
    required this.mapel,
    required this.mulai,
    required this.selesai,
    required this.jamKe,
    required this.guru,
    this.kelasID,
    this.hari,
  });

  factory JadwalPelajaranSiswaModel.fromJson(Map<String, dynamic> json) =>
      JadwalPelajaranSiswaModel(
          id: json['id'],
          mapel: json['mapel'],
          mulai: json['mulai'],
          selesai: json['selesai'],
          jamKe: json['jam_ke'],
          guru: json['guru'],
          hari: json['hari'],
          kelasID: json['kelas_id']);

  @override
  List<Object?> get props => [id, mapel, jamKe, mulai, selesai, guru, hari];
}
