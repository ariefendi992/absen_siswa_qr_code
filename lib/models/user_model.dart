import 'package:equatable/equatable.dart';

class UserSiswaModel extends Equatable {
  final int? id;
  final int? kelasId;
  final String? firstName;
  final String? lastName;
  final String? kelas;
  final String? nisn;
  final String? gender;
  final String? qrCode;

  const UserSiswaModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.kelas,
    required this.kelasId,
    required this.nisn,
    required this.gender,
    required this.qrCode,
  });

  factory UserSiswaModel.fromJson(Map<String, dynamic> json) {
    return UserSiswaModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kelasId: json['kelas_id'],
      kelas: json['kelas'],
      nisn: json['nisn'],
      gender: json['gender'],
      qrCode: json['qr_code'],
    );
  }

  @override
  List<Object?> get props =>
      [id, firstName, lastName, kelas, nisn, gender, kelasId, qrCode];
}
