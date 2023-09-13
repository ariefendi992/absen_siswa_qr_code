import 'package:equatable/equatable.dart';

class DataRiwayatPelanggaranSiswaModel extends Equatable {
  final int id;
  final String namaSiswa;
  final String pelapor;
  final String note;
  final String tglMelanggar;
  final String status;
  final String jenisPelanggaran;

  const DataRiwayatPelanggaranSiswaModel({
    required this.id,
    required this.namaSiswa,
    required this.pelapor,
    required this.note,
    required this.tglMelanggar,
    required this.status,
    required this.jenisPelanggaran,
  });

  factory DataRiwayatPelanggaranSiswaModel.fromJson(Map<String, dynamic> json) {
    return DataRiwayatPelanggaranSiswaModel(
        id: json['id'],
        namaSiswa: json['nama_siswa'],
        pelapor: json['pelapor'],
        note: json['note'],
        tglMelanggar: json['tgl_melanggar'],
        status: json['status'],
        jenisPelanggaran: json['jenis_pelanggaran']);
  }

  @override
  List<Object> get props => [id, namaSiswa, pelapor, note, tglMelanggar];
}

class RiwayatPelanggaranSiswaModel extends Equatable {
  final List<DataRiwayatPelanggaranSiswaModel> data;
  final Map<String, dynamic>? additionalData;

  const RiwayatPelanggaranSiswaModel({
    required this.data,
    this.additionalData,
  });

  factory RiwayatPelanggaranSiswaModel.fromJson(Map<String, dynamic> json) {
    return RiwayatPelanggaranSiswaModel(
        data: List<DataRiwayatPelanggaranSiswaModel>.from(
          json['data'].map(
            (x) => DataRiwayatPelanggaranSiswaModel.fromJson(x),
          ),
        ),
        additionalData: json);
  }

  @override
  List<Object?> get props => [additionalData, data];
}
