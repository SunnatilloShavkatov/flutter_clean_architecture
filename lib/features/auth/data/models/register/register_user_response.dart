class RegisterUserResponse {
  RegisterUserResponse({
    this.data,
    this.description,
    this.status,
  });

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    description = json["description"] as String?;
    status = json["status"] as String?;
  }

  Data? data;
  String? description;
  String? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    map["description"] = description;
    map["status"] = status;
    return map;
  }
}

class Data {
  Data({
    this.environmentId,
    this.loginTableSlug,
    this.resourceId,
    this.token,
    this.user,
    this.userFound,
    this.userId,
  });

  Data.fromJson(Map json) {
    environmentId = json["environment_id"] as String?;
    loginTableSlug = json["login_table_slug"] as String?;

    resourceId = json["resource_id"] as String?;

    token = json["token"] != null ? Token.fromJson(json["token"]) : null;
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    userFound = json["user_found"] as bool?;
    userId = json["user_id"] as String?;
  }

  String? environmentId;
  String? loginTableSlug;
  String? resourceId;
  Token? token;
  User? user;
  bool? userFound;
  String? userId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map["environment_id"] = environmentId;
    map["login_table_slug"] = loginTableSlug;

    map["resource_id"] = resourceId;

    if (token != null) {
      map["token"] = token?.toJson();
    }
    if (user != null) {
      map["user"] = user?.toJson();
    }
    map["user_found"] = userFound;
    map["user_id"] = userId;
    return map;
  }
}

class User {
  User({
    this.agreed,
    this.clientTypeId,
    this.guid,
    this.login,
    this.name,
    this.password,
    this.phone,
    this.roleId,
    this.surname,
    this.photo,
    this.patronymic,
  });

  User.fromJson(Map<String, dynamic> json) {
    agreed = json["agreed"];
    clientTypeId = json["client_type_id"];
    guid = json["guid"];
    login = json["login"];
    name = json["name"];
    password = json["password"];
    phone = json["phone"];
    roleId = json["role_id"];
    surname = json["surname"];
    photo = json["photo"];
    patronymic = json["patronymic"];
  }

  bool? agreed;
  String? clientTypeId;
  String? guid;
  String? login;
  String? name;
  String? password;
  String? phone;
  String? roleId;
  String? surname;
  String? patronymic;
  String? photo;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["agreed"] = agreed;
    map["client_type_id"] = clientTypeId;
    map["guid"] = guid;
    map["login"] = login;
    map["name"] = name;
    map["password"] = password;
    map["phone"] = phone;
    map["role_id"] = roleId;
    map["surname"] = surname;
    map["patronymic"] = patronymic;
    map["photo"] = photo;
    return map;
  }
}

class Token {
  Token({
    this.accessToken,
    this.createdAt,
    this.expiresAt,
    this.refreshInSeconds,
    this.refreshToken,
    this.updatedAt,
  });

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    createdAt = json["created_at"];
    expiresAt = json["expires_at"];
    refreshInSeconds = json["refresh_in_seconds"];
    refreshToken = json["refresh_token"];
    updatedAt = json["updated_at"];
  }

  String? accessToken;
  String? createdAt;
  String? expiresAt;
  num? refreshInSeconds;
  String? refreshToken;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["access_token"] = accessToken;
    map["created_at"] = createdAt;
    map["expires_at"] = expiresAt;
    map["refresh_in_seconds"] = refreshInSeconds;
    map["refresh_token"] = refreshToken;
    map["updated_at"] = updatedAt;
    return map;
  }
}
