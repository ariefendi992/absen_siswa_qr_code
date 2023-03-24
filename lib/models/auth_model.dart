import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final int id;
  final String? username;
  final String? password;
  final String group;

  const AuthModel({
    required this.id,
    required this.username,
    required this.password,
    required this.group,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        group: json['group']);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  @override
  List<Object?> get props => [id, username, password, group];
}
