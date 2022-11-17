import 'dart:async';

import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlotScreen extends StatefulWidget {
  @override
  _SlotScreenState createState() => _SlotScreenState();
}

class _SlotScreenState extends State<SlotScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Beli Slot",
          isHaveActions: false,
        ),
      ),
      body: WebView(
        navigationDelegate: (NavigationRequest request) {
          print('Navigating to ${request.url}');
          // Call any code here that you want
          return NavigationDecision.navigate;
        },
        initialUrl: 'https://koperasibmtkbs.com/member/beli-slot',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: _bookmarkButton(),
    );
  }

  _bookmarkButton() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            backgroundColor: ColorPallete.primaryColor,
            onPressed: () async {
              var url = await controller.data!.currentUrl();
              _favorites.add(url!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Saved $url for later reading.')),
              );
            },
            child: Icon(Icons.favorite),
          );
        }
        return Container();
      },
    );
  }
}
