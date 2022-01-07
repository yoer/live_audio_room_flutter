import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:live_audio_room_flutter/service/zego_room_service.dart';
import 'package:live_audio_room_flutter/service/zego_user_service.dart';
import 'package:live_audio_room_flutter/page/login/login_page.dart';
import 'package:live_audio_room_flutter/page/room/room_entrance_page.dart';
import 'package:live_audio_room_flutter/page/settings/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ZegoApp());
  // /// Optimization when screen refresh rate and display rate are inconsistent
  // GestureBinding.instance?.resamplingEnabled = true;
  // runZonedGuarded(() {
  //   ErrorWidget.builder = (FlutterErrorDetails details) {
  //     Zone.current.handleUncaughtError(details.exception, details.stack!);
  //     print(details.toString());
  //
  //     /// TODO@yuyj show error page
  //     return Center(
  //       child: Text(
  //           details.exception.toString() + "\n " + details.stack.toString()),
  //     );
  //   };
  //   runApp(const ZegoApp());
  // }, (Object obj, StackTrace stack) {
  //   print(obj);
  //   print(stack);
  // });
}

class ZegoApp extends StatelessWidget {
  const ZegoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ZegoUserService()),
        ChangeNotifierProvider(create: (context) => ZegoRoomService()),
      ],
      child: MaterialApp(
        title: "ZegoLiveAudio",
        initialRoute: "/login",
        routes: {
          "/login": (context) => LoginPage(),
          "/settings": (context) => const SettingsPage(),
          "/room_entrance": (context) => const RoomEntrancePage()
        },
      ),
    );
  }
}
