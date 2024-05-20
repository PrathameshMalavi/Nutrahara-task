import 'package:flutter/material.dart';
import 'package:web_viewproject/Screen%20Widgets/ErrorWidget.dart';
import 'package:web_viewproject/screens/SplashScreen.dart';
//import 'package:web_viewproject/Screens/SplashScreen.dart';
import 'package:web_viewproject/screens/WebViewScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen()//ErrorScreen(controller: WebViewController(), message: "",),
    );
  }
}
