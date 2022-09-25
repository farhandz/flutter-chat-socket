import 'package:cached_network_image/cached_network_image.dart';
import 'package:day60/models/chat/chat.dart';
import 'package:day60/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatWidget extends StatefulWidget {
  final UserModel chat;
  final IO.Socket socket;
  const ChatWidget({Key? key, required this.chat, required this.socket})
      : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        var chat = widget.chat;

        print(chat.id);
        // chat.messages = chat.messages.reversed.toList();
        // Navigator.pushNamed(context, '/message',
        //     arguments: {'chat': chat, 'socket': widget.socket});
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey.shade300,
        // backgroundImage: CachedNetworkImageProvider(widget.chat.avatarImage),
      ),
      title: Text(
        widget.chat.username,
        style: theme.textTheme.subtitle1
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      // subtitle: Padding(
      //   padding: EdgeInsets.only(top: 8.0),
      //   child: Text(
      //     widget.chat.messages.last.text!,
      //     style: theme.textTheme.bodyText2
      //         ?.copyWith(color: Colors.blueGrey.shade400),
      //   ),
      // ),
      // trailing: widget.chat.unReadCount > 0
      //     ? Column(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           Container(
      //             padding: EdgeInsets.all(5),
      //             decoration:
      //                 BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      //             child: Text(
      //               widget.chat.unReadCount.toString(),
      //               style: theme.textTheme.bodySmall?.copyWith(
      //                   fontWeight: FontWeight.w600, color: Colors.white),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             widget.chat.lastMessageAt,
      //             style: theme.textTheme.bodyText2
      //                 ?.copyWith(color: Colors.blueGrey.shade300),
      //           ),
      //         ],
      //       )
      //     : Text(
      //         widget.chat.lastMessageAt,
      //         style: theme.textTheme.bodyText2
      //             ?.copyWith(color: Colors.blueGrey.shade300),
      //       ),
    );
  }
}
