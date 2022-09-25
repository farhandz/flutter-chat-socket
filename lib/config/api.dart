class Api {
  //* Creating instance constructor;
  static Api instance = Api();
  //* Base API URL
  static const baseURL = "http://192.168.65.38:5000";

  //* ---------------
  //* ENDPOINT FIELD
  //* ----------------

  //* Collection Endpoint
  //* Please replace %latitude% and %longitude%
  //* with your location coordinate
  String getCollections = "$baseURL/collections?lat=%latitude%&lon=%longitude%";

  //* Collectionn login
  String loginEndpoint = "$baseURL/api/auth/login";

  //* Collection Register
  String registerEdnpoint = "$baseURL/api/auth/register";

  //* Collection logou
  String logoutEndpoint = "$baseURL/api/auth/logout";

  //* Collection alluser
  // @params id = user id
  String getendpointAllUser =
      "http://192.168.65.38:5000/api/auth/allusers/632e9076a002339694b376e3";

  // send message route
  String sendMessageRoute = "$baseURL/api/messages/addmsg";

  // get message recive route
  String recieveMessageRoute = "$baseURL/api/messages/getmsg";

  // set avatarRoute
  String setAvatarRoute = "$baseURL/api/auth/setavatar";
}
