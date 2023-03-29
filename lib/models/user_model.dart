// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? name;
  String? mail;
  String? password;
  bool? keepOn;
  User({
    required this.name,
    required this.mail,
    required this.password,
    this.keepOn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mail': mail,
      'password': password,
      'keepOn': keepOn,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? map['name'] as String : null,
      mail: map['mail'] != null ? map['mail'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      keepOn: map['keepOn'] != null ? map['keepOn'] as bool : null,
    );
  }

  String toString() {
    return "Name: " +
        this.name! +
        "\nE-mail: " +
        this.mail! +
        "\nPassword: " +
        this.password!;
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
