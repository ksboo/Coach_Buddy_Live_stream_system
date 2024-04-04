import 'package:flutter/material.dart';
import 'package:live_system/golive_screen.dart';

class button_screen extends StatefulWidget {
  const button_screen({super.key});

  @override
  State<button_screen> createState() => _button_screenState();
}

class _button_screenState extends State<button_screen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GoLiveScreen()),
            );
          },
          child: Text('go live'),
      ),
    );
  }
}