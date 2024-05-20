import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_viewproject/Uil/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports

import '../Screen Widgets/WebViewStack.dart';
import '../Uil/network.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController webViewController;

  @override
  void initState() {
    _webViewControllerInitialization();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: utilWidgets.CustomText("Nutrahara"),
        actions: [
          _getActionWidgets(),
        ],
      ),
      body: WebViewStack(
        controller: webViewController,
      ),
    );
  }

  Row _getActionWidgets() {
    return Row(
      children: [
        utilWidgets.CustomIcon(Icons.arrow_back, () async {
          if (await webViewController.canGoBack()) {
            await webViewController.goBack();
          } else {
            utilWidgets.CustomSnackBar(
                context, 'No back history item', Icons.error);
            return;
          }
        }),
        utilWidgets.CustomIcon(Icons.arrow_forward, () async {
          if (await webViewController.canGoForward()) {
            await webViewController.goForward();
          } else {
            utilWidgets.CustomSnackBar(
                context, 'No forward history item', Icons.error);
            return;
          }
        }),
        utilWidgets.CustomIcon(Icons.replay, () async {
          if (await Network.isOnline()) {
            webViewController.reload();
          }
        }),
      ],
    );
  }

  _webViewControllerInitialization() {
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://nutrahara.com'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    webViewController = controller;
  }
}
