import 'package:flutter/material.dart';
import 'package:zego_implement/live.dart';

class live_streaming extends StatefulWidget {
  const live_streaming({super.key});

  @override
  State<live_streaming> createState() => _live_streamingState();
}

class _live_streamingState extends State<live_streaming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () => live_start(context, isHost: true),
              child: Text('go live'),
            ),
            SizedBox(height : 50),
            ElevatedButton(
              onPressed: () => live_start(context, isHost: false),
              child: Text('watch a live'),
            )
          ],
        ),
      ),
    );
  }

  live_start(BuildContext context, {required bool isHost}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LivePage(
                  isHost: isHost,
                )));
  }
}

