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

class RiwayatAbsensiModel extends Equatable {
  final int id;
  final String namaSiswa;
  final String namaGuru;
  final String kelas;
  final String mapel;
  final String tglAbsen;

  const RiwayatAbsensiModel({
    required this.id,
    required this.kelas,
    required this.mapel,
    required this.namaGuru,
    required this.namaSiswa,
    required this.tglAbsen,
  });

  factory RiwayatAbsensiModel.fromJson(Map<String, dynamic> json) =>
      RiwayatAbsensiModel(
        id: json['id'],
        kelas: json['kelas'],
        mapel: json['mapel'],
        namaGuru: json['nama_guru'],
        namaSiswa: json['nama_siswa'],
        tglAbsen: json['tgl_absen'],
      );

  @override
  List<Object> get props => [id, kelas, mapel, namaGuru, namaSiswa, tglAbsen];
}
