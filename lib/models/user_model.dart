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
  final String? statusLoggedIn;
  final String? picture;
  final String? semester;
  final String? today;

  const UserSiswaModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.kelas,
    required this.kelasId,
    required this.nisn,
    required this.gender,
    required this.qrCode,
    this.statusLoggedIn,
    this.picture,
    this.semester,
    this.today,
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
      picture: json['picture'],
      semester: json['semester'],
      statusLoggedIn: json['status_logged_in'],
      today: json['today'],
    );
  }

  @override
  List<Object?> get props =>
      [id, firstName, lastName, kelas, nisn, gender, kelasId, qrCode];
}

class UserGuruModel extends Equatable {
  final int? id;
  final String? nip;
  final String? firstName;
  final String? lastName;
  final String? fullname;
  final String? gender;
  final String? agama;
  final String? alamat;
  final String? telp;
  final String? mapel;
  final Map<String, dynamic>? additionalData;

  const UserGuruModel({
    required this.id,
    required this.nip,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.agama,
    this.alamat,
    this.telp,
    this.mapel,
    this.fullname,
    this.additionalData,
  });

  factory UserGuruModel.fromJson(Map<String, dynamic> json) {
    return UserGuruModel(
      id: json['id'],
      nip: json['nip'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      agama: json['agama'],
      alamat: json['alamat'],
      telp: json['telp'],
      mapel: json['mapel'],
      additionalData: json,
    );
  }

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "fullname": fullname,
        "gender": gender,
        "agama": agama,
        "alamat": alamat,
        "telp": telp
      };

  @override
  List<Object?> get props => [
        id,
        nip,
        firstName,
        lastName,
        gender,
        agama,
        alamat,
        telp,
        mapel,
      ];
}
