class UserEditFormModel {
  final String? name;
  final String? username;
  final String? email;
  final String? password;

  UserEditFormModel({
    this.email,
    this.username,
    this.name,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
