import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Uil/network.dart';
import 'ErrorWidget.dart';

class WebViewStack extends StatefulWidget {
  WebViewStack({required this.controller, super.key});

  final WebViewController controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  bool online = true;

  late bool websiteErrorInLoading = false;
  String message = "Site could not be loaded, Please Refresh";

  @override
  void initState() {
    super.initState();
    _checkConnection();
    _setUpNavigationDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: online,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: WebViewWidget(
              controller: widget.controller,
            ),
          ),
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
        Visibility(
          visible: websiteErrorInLoading,
          child: ErrorScreen(
            controller: widget.controller,
            message: message,
          ),
        )
      ],
    );
  }

  _setUpNavigationDelegate() {
    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
            websiteErrorInLoading = false;
          });
        },
        //This is where we handle the error occured during website loading
        onWebResourceError: (WebResourceError error) {
          _webErrorHandling(error);
        },
        onNavigationRequest: (NavigationRequest request) {
          debugPrint('allowing navigation to ${request.url}');
          return NavigationDecision.navigate;
        },
        onUrlChange: (UrlChange change) {
          debugPrint('url change to ${change.url} ${change}');
        },
      ),
    );
  }

  _webErrorHandling(WebResourceError error) {
    if (error.errorCode == -1) {
      //Regular Content Loading
      websiteErrorInLoading = false;
      message = "";
    } else if (error.errorCode == -2) {
      //Internet Connection Errror
      message = "Please Check Your Internet connection \n And Reload";
      websiteErrorInLoading = true;
    } else {
      //Other Error
      message =
          "The Content is being Loaded \n Issue : ${error.description} \nIf it takes too long \n Please Reload!!";
      websiteErrorInLoading = true;
    }
    debugPrint(
        '''Page resource error: code: ${error.errorCode} description: ${error.description} errorType: ${error.errorType} isForMainFrame: ${error.isForMainFrame} ''');
    setState(() {
      websiteErrorInLoading;
      message;
    });
  }

  _checkConnection() async {
    online = await Network.isOnline();
    if (!online)
      message = "Please Check Your Internet connection \n And Reload";
    setState(() {
      online;
      message;
    });
  }
}
