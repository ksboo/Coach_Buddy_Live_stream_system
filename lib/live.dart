import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

final String userID = Random().nextInt(10000).toString();

class LivePage extends StatelessWidget {
  const LivePage({Key? key, this.isHost = false}) : super(key: key);
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltLiveStreaming(
      appID: 1800314291,
      appSign:
          '417dffbaa5ffb600c4846abcd15ab86418ffe1ca24133cf71db00ac96d7ab6f9',
      userID: userID,
      userName: 'user_$userID',
      liveID: 'testLiveID',
      config: isHost
          ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
          : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
    );
  }
}

