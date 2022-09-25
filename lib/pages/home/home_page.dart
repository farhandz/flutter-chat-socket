import 'package:day60/pages/home/tabs/chat_tab.dart';
import 'package:day60/pages/home/tabs/explore_tab.dart';
import 'package:day60/pages/home/tabs/notification_tab.dart';
import 'package:day60/pages/home/tabs/user_tab.dart';
import 'package:day60/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static IO.Socket socket =
      IO.io("http://192.168.65.38:5000", <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  final tabs = <Widget>[
    ExploreTab(),
    ChatTab(
      socket: socket,
    ),
    NotificationTab(),
    UserTab(),
  ];

  late PageController _pageController;
  int currentTab = 1;

  goToTab(int page) {
    setState(() {
      currentTab = page;
    });

    _pageController.jumpToPage(page);
  }

  // void getAllUser() async {
  //   _user = await _userService.getAll("632e9076a002339694b376e3", context);
  //   print(_user.length);
  // }

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    initSocket();
    super.initState();
  }

  initSocket() {
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    // socket.onDisconnect((_) => print('Connection Disconnection'));
    // socket.onConnectError((err) => print(err));
    // socket.onError((err) => print(err));

    // to tess
    // socket.emit('sendNewMessage', "hai");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: tabs,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.lightBackgroundColor,
        elevation: 0,
        notchMargin: 10,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomAppBarItem(icon: Iconsax.home5, page: 0),
              _bottomAppBarItem(icon: Iconsax.message5, page: 1),
              _bottomAppBarItem(icon: Iconsax.notification5, page: 2),
              _bottomAppBarItem(icon: Iconsax.category5, page: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem({icon, page}) {
    return IconButton(
      splashRadius: 20,
      onPressed: () => goToTab(page),
      icon: Icon(
        icon,
        color: currentTab == page
            ? ColorConstants.primaryColor
            : Colors.blueGrey.shade200,
        size: 22,
      ),
    );
  }
}
