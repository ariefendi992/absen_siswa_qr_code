import 'package:absen_siswa_qr_code/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AbsenSiswaModel extends Equatable {
  final int? id;
  final int? mengajarID;
  final int? siswaID;
  final String? tglAbsen;
  final String? keterangan;
  final int? mapelID;

  const AbsenSiswaModel({
    this.id,
    this.mengajarID,
    this.siswaID,
    this.keterangan,
    this.tglAbsen,
    this.mapelID,
  });

  factory AbsenSiswaModel.fromJson(Map<String, dynamic> json) =>
      AbsenSiswaModel(
        id: json['id'] ?? null,
        mengajarID: json['mengajar_id'],
        siswaID: json['siswa_id'],
        keterangan: json['keterangan'],
        tglAbsen: json['tgl_absen'],
        mapelID: json['mapel_id'],
      );

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
  final DataRiwayat? dataRiwayat;

  ScanSiswaModel({
    this.data,
    this.status,
    this.additionalData,
    this.dataRiwayat,
  });

  factory ScanSiswaModel.fromJson(Map<String, dynamic> json) => ScanSiswaModel(
        data: UserSiswaModel.fromJson(json['data']),
        status: json['status'],
        additionalData: json,
        dataRiwayat: DataRiwayat.fromJson(json['data']),
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
  final String keterangan;

  RAbsensiModel({
    required this.id,
    required this.namaSiswa,
    required this.mapel,
    required this.kelas,
    required this.namaGuru,
    required this.tglAbsen,
    required this.keterangan,
  });

  factory RAbsensiModel.fromJson(Map<String, dynamic> json) => RAbsensiModel(
        id: json['id'],
        namaSiswa: json['nama_siswa'],
        mapel: json['mapel'],
        kelas: json['kelas'],
        namaGuru: json['nama_guru'],
        tglAbsen: json['tgl_absen'],
        keterangan: json['ket'],
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

class RiwayatAbsenSiswaMapelModel extends Equatable {
  final String tglAbsen;
  final String keterangan;
  final int pertemuan;

  const RiwayatAbsenSiswaMapelModel({
    required this.tglAbsen,
    required this.keterangan,
    required this.pertemuan,
  });

  factory RiwayatAbsenSiswaMapelModel.fromJson(Map<String, dynamic> json) {
    return RiwayatAbsenSiswaMapelModel(
      tglAbsen: json['tgl_absen'],
      keterangan: json['keterangan'],
      pertemuan: json['pertemuan'],
    );
  }

  @override
  List<Object> get props => [tglAbsen, keterangan, pertemuan];
}

class DataRiwayat extends Equatable {
  final List<RiwayatAbsenSiswaMapelModel> data;

  const DataRiwayat({required this.data});

  factory DataRiwayat.fromJson(Map<String, dynamic> json) {
    return DataRiwayat(
      data: List<RiwayatAbsenSiswaMapelModel>.from(
        json['riwayat_absen'].map(
          (x) => RiwayatAbsenSiswaMapelModel.fromJson(x),
        ),
      ),
    );
  }

  @override
  List<Object> get props => [data];
}
