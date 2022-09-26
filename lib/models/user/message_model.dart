class MessageModel {
  MessageModel({
    required this.fromSelf,
    required this.message,
  });
  late final bool fromSelf;
  late final String message;

  MessageModel.fromJson(Map<String, dynamic> json) {
    fromSelf = json['fromSelf'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fromSelf'] = fromSelf;
    _data['message'] = message;
    return _data;
  }
}
