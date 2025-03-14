class AccessTokenModel{
  final String?accessToken;
  final String?expiredTime;
  final String?refreshToken;

  const AccessTokenModel({
    this.accessToken,
    this.expiredTime,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    return {
      "accessToken": this.accessToken,
      "expiredTime": this.expiredTime,
      "refreshToken": this.refreshToken,
    };
  }

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) {
    return AccessTokenModel(
      accessToken: json["accessToken"],
      expiredTime: json["expiredTime"],
      refreshToken: json["refreshToken"],
    );
  }
//
}