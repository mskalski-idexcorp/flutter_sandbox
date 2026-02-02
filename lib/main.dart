import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(size: Size(800, 600));
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: _customAppBar(), body: _customBox()),
    );
  }
}

AppBar _customAppBar() =>
    AppBar(backgroundColor: Colors.green, title: const Text('Flutter sandbox'));

Widget _customBox() => Container(
  alignment: Alignment.center,
  height: 100,
  width: 200,
  padding: const EdgeInsets.all(4),
  margin: const EdgeInsets.all(30),
  decoration: _customBoxDecoration(),
  child: const Text('Welcome to OneProTouch!'),
);

BoxDecoration _customBoxDecoration() => BoxDecoration(
  border: Border.all(color: Colors.black, width: 10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ],
  color: Colors.red,
);
