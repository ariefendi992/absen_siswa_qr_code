import 'package:equatable/equatable.dart';

class RiwayatPelanggaranSiswaModel extends Equatable {
  final int id;
  final String namaSiswa;
  final String pelapor;
  final String note;
  final String tglMelanggar;

  const RiwayatPelanggaranSiswaModel({
    required this.id,
    required this.namaSiswa,
    required this.pelapor,
    required this.note,
    required this.tglMelanggar,
  });

  factory RiwayatPelanggaranSiswaModel.fromJson(Map<String, dynamic> json) {
    return RiwayatPelanggaranSiswaModel(
      id: json['id'],
      namaSiswa: json['nama_siswa'],
      pelapor: json['pelapor'],
      note: json['note'],
      tglMelanggar: json['tgl_melanggar'],
    );
  }

  @override
  List<Object> get props => [id, namaSiswa, pelapor, note, tglMelanggar];
}
