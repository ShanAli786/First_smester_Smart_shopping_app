// ignore_for_file: depend_on_referenced_packages, duplicate_import

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(CameraAppSecond(cameras: cameras));
}

class CameraAppSecond extends StatelessWidget {
  final List<CameraDescription> cameras;

  const CameraAppSecond({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(cameras),
    );
  }
}
