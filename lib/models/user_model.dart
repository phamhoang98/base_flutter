class UserModel{
  final int id;
  final String? name;
  final String? token;
  final String? refreshToken;


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      token: json["token"],
      refreshToken: json["refreshToken"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "token": token,
      "refreshToken": refreshToken,
    };
  }

  const UserModel({
    required this.id,
    this.name,
    this.token,
    this.refreshToken,
  }); //
}
