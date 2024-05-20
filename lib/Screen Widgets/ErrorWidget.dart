import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:web_viewproject/Uil/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(
      {required this.controller, super.key, required this.message});

  final WebViewController controller;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/animations/loading_anim.json"),
              Text( message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              )
            ],
          )),
    );
  }
}
