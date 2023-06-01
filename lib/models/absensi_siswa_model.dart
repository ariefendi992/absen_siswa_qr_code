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
