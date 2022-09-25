class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.avatarImage,
  });
  late final String id;
  late final String username;
  late final String email;
  late final String avatarImage;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    avatarImage = json['avatarImage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['avatarImage'] = avatarImage;
    return _data;
  }
}
