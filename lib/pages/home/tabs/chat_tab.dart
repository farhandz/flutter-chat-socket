import 'package:day60/data/chat.dart';
import 'package:day60/models/user/user_model.dart';
import 'package:day60/pages/home/tabs/components/chat_widget.dart';
import 'package:day60/pages/home/tabs/components/story_list.dart';
import 'package:day60/service/user_service.dart';
import 'package:day60/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatTab extends StatefulWidget {
  final IO.Socket socket;

  const ChatTab({Key? key, required this.socket}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final chats = getChats();

  late List<UserModel> _user = [];
  var _userService = userService();

  void getAllUser() async {
    var data = await _userService.getAll("632e9076a002339694b376e3", context);
    setState(() {
      _user = data;
    });
    print(_user.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.lightBackgroundColor,
        elevation: 0,
        title: Text(
          'chat',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Iconsax.search_normal_1,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            StoryList(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Chats",
                style: theme.textTheme.subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Column(
              children: _user
                  .map((e) => Column(
                        children: [
                          ChatWidget(
                            chat: e,
                            socket: widget.socket,
                          ),
                          _user.indexOf(e) != chats.length - 1
                              ? Divider(
                                  indent: 80,
                                  height: 1,
                                  endIndent: 16,
                                )
                              : SizedBox(),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
