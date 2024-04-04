import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // => dependency : camera 

class GoLiveScreen extends StatefulWidget {
  const GoLiveScreen({Key? key}) : super(key: key);

  @override
  _GoLiveScreenState createState() => _GoLiveScreenState();
}

class _GoLiveScreenState extends State<GoLiveScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late bool _isFrontCamera = false;
  bool _isStreaming = false;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      _isFrontCamera ? cameras.last : firstCamera,
      ResolutionPreset.medium,
    );

    return _controller.initialize();
  }

  void _toggleCamera() async {
    await _controller.dispose();
    setState(() {
      _isFrontCamera = !_isFrontCamera;
      _initializeControllerFuture = _initializeCamera();
    });
  }

  void _toggleStreaming() {
    setState(() {
      _isStreaming = !_isStreaming;
      if (_isStreaming) {
        _controller.startImageStream((CameraImage image) {
          // Process the live video frames here
          // You can use the 'image' object to access video frames
          // here is where you can apply custom filters or effects to the live video frames
        });
      } else {
        _controller.stopImageStream();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Live'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleStreaming,
            child: Icon(_isStreaming ? Icons.stop : Icons.play_arrow),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _toggleCamera,
            child: Icon(Icons.flip_camera_ios),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
