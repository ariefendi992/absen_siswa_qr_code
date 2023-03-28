import 'package:equatable/equatable.dart';

class UserSiswaModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String kelas;
  final String nisn;
  final String gender;

  const UserSiswaModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.kelas,
    required this.nisn,
    required this.gender,
  });

  factory UserSiswaModel.fromJson(Map<String, dynamic> json) {
    return UserSiswaModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      kelas: json['kelas'],
      nisn: json['nisn'],
      gender: json['gender'],
    );
  }

  @override
  List<Object> get props => [id, firstName, lastName, kelas, nisn, gender];
}
