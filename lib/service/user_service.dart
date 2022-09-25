import 'package:day60/config/api.dart';
import 'package:day60/models/user/user_model.dart';
import 'package:day60/service/base/base_service.dart';
import 'package:flutter/cupertino.dart';

class userService extends BaseServices {
  Future<List<UserModel>> getAll(String id_user, BuildContext context) async {
    var resp = await request(
        Api.instance.getendpointAllUser, RequestType.GET, context,
        useToken: true);
    var restaurantList = <UserModel>[];
    // * Check if response contains restaurant list
    if (resp.containsKey("data")) {
      resp["data"].forEach((val) {
        restaurantList.add(UserModel.fromJson(val));
      });
    }
    return restaurantList;
  }
}
