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
  List<Object> get props => [id, namaGuru, mapel];
}

class JadwalMengajarHarianModel extends Equatable {
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

  const JadwalMengajarHarianModel({
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
