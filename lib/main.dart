import 'package:day60/pages/call/video/video_call_page.dart';
import 'package:day60/pages/home/home_page.dart';
import 'package:day60/pages/message_page.dart';
import 'package:day60/pages/splash/splash_page.dart';
import 'package:day60/pages/story/story_page.dart';
import 'package:day60/provider/chat_provder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ChatProvider())],
      child: MaterialApp(
        home: MainPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/message': (context) => MessagePage(),
          '/story': (context) => StoryPage(),
          '/video-call': (context) => VideoCallPage(),
        },
      ),
    );
  }
}
