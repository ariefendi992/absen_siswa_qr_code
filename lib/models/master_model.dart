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
