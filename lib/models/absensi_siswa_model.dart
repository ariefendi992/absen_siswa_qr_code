import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AbsenSiswaModel extends Equatable {
  final int? id;
  final int? mengajarID;
  final int? siswaID;
  final String? tglAbsen;
  final String? keterangan;

  const AbsenSiswaModel({
    this.id,
    this.mengajarID,
    this.siswaID,
    this.keterangan,
    this.tglAbsen,
  });

  factory AbsenSiswaModel.fromJson(Map<String, dynamic> json) =>
      AbsenSiswaModel(
          id: json['id'] ?? null,
          mengajarID: json['mengajar_id'],
          siswaID: json['siswa_id'],
          keterangan: json['keterangan'],
          tglAbsen: json['tgl_absen']);

  Map<String, dynamic> toJson() => {
        'mengajar_id': mengajarID,
        'siswa_id': siswaID,
        'keterangan': keterangan,
      };

  @override
  List<Object> get props => [];
}

class ScanSiswaModel extends Equatable {
  final UserSiswaModel? data;
  final String? status;
  final Map<String, dynamic>? additionalData;

  ScanSiswaModel({
    this.data,
    this.status,
    this.additionalData,
  });

  factory ScanSiswaModel.fromJson(Map<String, dynamic> json) => ScanSiswaModel(
        data: UserSiswaModel.fromJson(json['data']),
        status: json['status'],
        additionalData: json,
      );

  @override
  List<Object?> get props => [data, status, additionalData];
}

class RAbsensiModel {
  final int id;
  final String namaSiswa;
  final String kelas;
  final String mapel;
  final String namaGuru;
  final String tglAbsen;

  RAbsensiModel({
    required this.id,
    required this.namaSiswa,
    required this.mapel,
    required this.kelas,
    required this.namaGuru,
    required this.tglAbsen,
  });

  factory RAbsensiModel.fromJson(Map<String, dynamic> json) => RAbsensiModel(
        id: json['id'],
        namaSiswa: json['nama_siswa'],
        mapel: json['mapel'],
        kelas: json['kelas'],
        namaGuru: json['nama_guru'],
        tglAbsen: json['tgl_absen'],
      );
}

/// * API SISWA
class RiwayatAbsenSiswaModel extends Equatable {
  final int id;
  final String ket;
  final String tglAbsen;
  final int urutan;
  final String? mapel;

  const RiwayatAbsenSiswaModel({
    required this.id,
    required this.ket,
    required this.tglAbsen,
    required this.urutan,
    this.mapel,
  });

  factory RiwayatAbsenSiswaModel.fromJson(Map<String, dynamic> json) {
    return RiwayatAbsenSiswaModel(
      id: json['id'],
      ket: json['ket'],
      tglAbsen: json['tgl_absen'],
      urutan: json['urutan'],
      mapel: json['mapel'],
    );
  }

  @override
  List<Object?> get props => [id, ket, tglAbsen, urutan, mapel];
}
