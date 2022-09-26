import 'package:day60/config/api.dart';
import 'package:day60/models/user/message_model.dart';
import 'package:day60/service/base/base_service.dart';
import 'package:flutter/cupertino.dart';

class MessageSevice extends BaseServices {
  Future<List<MessageModel>> getAllMessage(BuildContext context, data) async {
    var resp = await request(
        Api.instance.recieveMessageRoute, RequestType.POST, context,
        useToken: true, data: data);
    var messageList = <MessageModel>[];
    // * Check if response contains restaurant li
    if (resp.containsKey("data")) {
      resp["data"].forEach((val) {
        messageList.add(MessageModel.fromJson(val));
      });
    }
    return messageList;
  }

  Future<void> addMessage(BuildContext context, data) async {
    var resp = await request(
        Api.instance.sendMessageRoute, RequestType.POST, context,
        useToken: true, data: data);

    print(data);
  }
}
