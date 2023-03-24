import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final int id;
  final String username;
  final String password;

  const AuthModel(
      {required this.id, required this.username, required this.password});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        // 'group': group,
        // 'kelas': kelas,
      };

  @override
  List<Object> get props => [id, username, password];
}
