class LoginModel {
  late String? token;
  late String? refeshToken;
  late String? oauthId;
  late int? expiresIn;
  late bool? isNew;
  late bool? hasUsernamePassword;

  LoginModel(
      {this.token,
      this.refeshToken,
      this.oauthId,
      this.expiresIn,
      this.isNew,
      this.hasUsernamePassword});

  LoginModel.fromJson(Map<String, dynamic> json) {
    this.token = json['access_token'];
    this.refeshToken = json['refresh_token'];
    this.oauthId = json['oauth_id'];
    this.expiresIn = json['expires_in'];
    this.isNew = json['is_new'];
    this.hasUsernamePassword = json['has_username_password'];
  }

  Map<String, dynamic> toJson() => {
        'access_token': this.token,
        'refresh_token': this.refeshToken,
        'oauth_id': this.oauthId,
        'expires_in': this.expiresIn,
        'is_new': this.isNew,
        'has_username_password': this.hasUsernamePassword
      };
}
